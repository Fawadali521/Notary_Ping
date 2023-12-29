// ignore_for_file: file_names

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension ToBitDescription on Widget {
  /// Converts the widget to a [BitmapDescriptor] that can be used as a marker icon on Google Maps.
  ///
  /// The resulting [BitmapDescriptor] can be used to customize the appearance of a marker on the map.
  ///
  /// The [logicalSize] parameter specifies the size of the widget when laid out in the widget tree.
  /// The [imageSize] parameter specifies the size of the resulting image.
  ///
  /// The [waitToRender] parameter specifies the duration to wait for the widget to render before capturing the image.
  /// This is useful for widgets that require additional time to load, such as network or asset images.
  ///
  /// The [textDirection] parameter specifies the text direction of the widget.
  ///
  /// Returns a [Future] that completes with the [BitmapDescriptor] representing the widget as an image.
  Future<BitmapDescriptor> toBitmapDescriptor({
    Size? logicalSize,
    Size? imageSize,
    Duration waitToRender = const Duration(milliseconds: 300),
    TextDirection textDirection = TextDirection.ltr,
  }) async {
    final widget = RepaintBoundary(
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: this,
        ),
      ),
    );
    final pngBytes = await createImageFromWidget(
      widget,
      waitToRender: waitToRender,
      logicalSize: logicalSize,
      imageSize: imageSize,
    );
    return BitmapDescriptor.fromBytes(pngBytes);
  }
}

/// Creates an image from the given widget by first spinning up an element and render tree,
/// and waits for [waitToRender] duration to render the widget.
///
/// The final image will have a size of [imageSize], and the widget will be laid out and rendered
/// with the given [logicalSize].
/// If [logicalSize] is not provided, it will be calculated from the app's main window.
///
/// Returns a [Future] that completes with a [Uint8List] representing the image.
Future<Uint8List> createImageFromWidget(
  Widget widget, {
  Size? logicalSize,
  required Duration waitToRender,
  Size? imageSize,
}) async {
  final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
  final view = ui.PlatformDispatcher.instance.views.first;
  logicalSize ??= view.physicalSize / view.devicePixelRatio;
  imageSize ??= view.physicalSize;

  final RenderView renderView = RenderView(
    view: view,
    child: RenderPositionedBox(
      alignment: Alignment.center,
      child: repaintBoundary,
    ),
    configuration: ViewConfiguration(
      size: logicalSize,
      devicePixelRatio: 1.0,
    ),
  );

  final PipelineOwner pipelineOwner = PipelineOwner();
  final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

  pipelineOwner.rootNode = renderView;
  renderView.prepareInitialFrame();

  final RenderObjectToWidgetElement<RenderBox> rootElement =
      RenderObjectToWidgetAdapter<RenderBox>(
    container: repaintBoundary,
    child: widget,
  ).attachToRenderTree(buildOwner);

  buildOwner.buildScope(rootElement);

  await Future.delayed(waitToRender);

  buildOwner.buildScope(rootElement);
  buildOwner.finalizeTree();

  pipelineOwner.flushLayout();
  pipelineOwner.flushCompositingBits();
  pipelineOwner.flushPaint();

  final ui.Image image = await repaintBoundary.toImage(
    pixelRatio: imageSize.width / logicalSize.width,
  );
  final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return byteData!.buffer.asUint8List();
}
