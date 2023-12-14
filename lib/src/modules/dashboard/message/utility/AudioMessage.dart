// ignore_for_file: file_names, constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';

import '../../../../../index.dart';

const double BUBBLE_RADIUS = 16;

class AudioMessage extends StatefulWidget {
  final bool isSender;
  final int? index;
  final String? path;
  final double? width;
  final Directory appDirectory;
  final String? time;

  const AudioMessage({
    Key? key,
    required this.appDirectory,
    this.width,
    this.index,
    this.isSender = false,
    this.path,
    this.time,
  }) : super(key: key);

  @override
  State<AudioMessage> createState() => _AudioMessageState();
}

class _AudioMessageState extends State<AudioMessage> {
  File? file;
  late PlayerController controller;
  late StreamSubscription<PlayerState> playerStateSubscription;

  PlayerWaveStyle playerWaveStyle = const PlayerWaveStyle(
    fixedWaveColor: Colors.white54,
    liveWaveColor: Colors.white,
    spacing: 6,
  );

  @override
  void initState() {
    setState(() {
      playerWaveStyle = PlayerWaveStyle(
        fixedWaveColor: widget.isSender ? Colors.white54 : Colors.black54,
        liveWaveColor: widget.isSender ? Colors.white : Colors.black,
        spacing: 6,
      );
    });
    super.initState();
    controller = PlayerController();
    _preparePlayer();
    playerStateSubscription = controller.onPlayerStateChanged.listen((_) {
      setState(() {});
    });
  }

  void _preparePlayer() async {
    // Opening file from assets folder
    if (widget.index != null) {
      file = File('${widget.appDirectory.path}/audio${widget.index}.mp3');
      await file?.writeAsBytes(
          (await rootBundle.load('assets/audios/audio${widget.index}.mp3'))
              .buffer
              .asUint8List());
    }
    if (widget.index == null && widget.path == null && file?.path == null) {
      return;
    }
    // Prepare player with extracting waveform if index is even.
    controller.preparePlayer(
      path: widget.path ?? file!.path,
      shouldExtractWaveform: widget.index?.isEven ?? true,
    );
    // Extracting waveform separately if index is odd.
    if (widget.index?.isOdd ?? false) {
      controller
          .extractWaveformData(
            path: widget.path ?? file!.path,
            noOfSamples:
                playerWaveStyle.getSamplesForWidth(widget.width ?? 200),
          )
          .then((waveformData) => debugPrint(waveformData.toString()));
    }
  }

  @override
  void dispose() {
    playerStateSubscription.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.path != null || file?.path != null
        ? Align(
            alignment:
                widget.isSender ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: !widget.isSender
                  ? EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * .2)
                  : const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(bottom: widget.time == null ? 10 : 20),
                    decoration: BoxDecoration(
                      color: widget.isSender
                          ? Palette.primaryColor
                          : Palette.reciveChatColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(BUBBLE_RADIUS),
                        bottomRight: const Radius.circular(BUBBLE_RADIUS),
                        topLeft: Radius.circular(
                            widget.isSender ? BUBBLE_RADIUS : 0),
                        topRight: Radius.circular(
                            widget.isSender ? 0 : BUBBLE_RADIUS),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!controller.playerState.isStopped)
                          IconButton(
                            onPressed: () async {
                              controller.playerState.isPlaying
                                  ? await controller.pausePlayer()
                                  : await controller.startPlayer(
                                      finishMode: FinishMode.loop,
                                    );
                            },
                            icon: Icon(
                              controller.playerState.isPlaying
                                  ? Icons.stop_circle_outlined
                                  : Icons.play_circle_fill_rounded,
                            ),
                            color:
                                widget.isSender ? Colors.white : Colors.black,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        AudioFileWaveforms(
                          size: Size(MediaQuery.of(context).size.width / 2, 20),
                          playerController: controller,
                          animationCurve: Curves.bounceInOut,
                          waveformType: widget.index?.isOdd ?? false
                              ? WaveformType.fitWidth
                              : WaveformType.long,
                          playerWaveStyle: PlayerWaveStyle(
                            fixedWaveColor: widget.isSender
                                ? Colors.white54
                                : Colors.black54,
                            liveWaveColor:
                                widget.isSender ? Colors.white : Colors.black,
                            spacing: 6,
                          ),
                        ),
                        if (widget.isSender) const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 8,
                    child: Text(
                      widget.time ?? "",
                      style: TextStyles.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
