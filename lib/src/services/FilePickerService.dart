// ignore_for_file: avoid_print

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:logger/logger.dart';
import 'package:notary_ping/index.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

class FilePickerService {
  File? selectedImage;
  final Logger log = Logger();

  Future<File?> pickImage() async {
    print("print 2");
    return await pickImageWithoutCompression();
  }

  selectPdf() async {
    File? selectedPdf;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      selectedPdf = File(result.paths.first!);
      final extension = p.extension(selectedPdf.path);
      debugPrint('@FilePcikerService.pickPdf ==> Extension: $extension');

      if (extension == '.pdf') {
        return selectedPdf;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  pickImageWithoutCompression() async {
    print("print 3");
    File? selectedImage;
    final filePicker = FilePicker.platform;
    print("print 4");
    FilePickerResult? result = await filePicker.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    print("print 5 $result");
    if (result != null) {
      selectedImage = File(result.paths.first!);
      final extension = p.extension(selectedImage.path);
      debugPrint('@FilePcikerService.pickImage ==> Extension: $extension');

      if (
          // extension == '.heic' ||
          extension == '.jpg' ||
              extension == '.jpeg' ||
              extension == '.png' ||
              extension == '.gif') {
        // if (extension == '.heic') {
        //   String? jpegPath = await HeicToJpg.convert(selectedImage.path);
        //   if (jpegPath != null) selectedImage = File(jpegPath);
        // }
        return selectedImage;
      } else {
        Get.snackbar("Error!", "Please select image only",
            backgroundColor: Palette.primaryColor,
            colorText: Palette.whiteColor);
        return null;
      }
    }
  }

  // Future<File?> _compressImageFile(File file, String targetPath) async {
  //   debugPrint(
  //       '@compressImageFile => Size before compression: ${await file.length()}');
  //   var result = await FlutterImageCompress.compressAndGetFile(
  //     file.absolute.path,
  //     targetPath,
  //     quality: 70,
  //   );

  //   if (result != null) {
  //     print('File compressed successfully');
  //   } else {
  //     print('Compressed file path is null');
  //   }

  //   debugPrint(
  //       '@compressImageFile => Size after compression: ${await result?.length()}');
  //   return result;
  // }
}
