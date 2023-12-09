// // ignore_for_file: file_names, avoid_print

// import 'package:fiftyonestores/src/services/FilePikerService.dart';
// import 'package:fiftyonestores/src/states/dashboard/DashboardState.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter_dropzone/flutter_dropzone.dart';

// import '../../../modules/index.dart';

// class DashboardController extends GetxController {
//   late DropzoneViewController dropZoneViewController;
//   final state = DashboardState();
//   final primeFormKey = GlobalKey<FormState>();
//   final subFormKey = GlobalKey<FormState>();

//   void changeIndex(int indexDrawer, int indexPage) {
//     state.selectedIndex = indexDrawer;
//     state.selectedPageIndex = indexPage;
//   }

//   void changeExpand({bool? value}) {
//     if (value != null) {
//       state.isExpand = value;
//     } else {
//       state.isExpand = !state.isExpand;
//     }
//   }

//   void changeMarginCalculation(bool value) {
//     state.switchValue.value = value;
//   }

//   String? validateField(String? value, String fieldName) {
//     if (value == null || value.isEmpty) {
//       return '$fieldName ${'is required'.tr}';
//     }
//     return null;
//   }

//   pickFile() async {
//     FilePickerResult? result;
//     result = await FilePickerService().selectFile();
//     if (result != null) {
//       print("result not null => ${result.files.single.name}");
//       state.subCageryFileName.value = result.files.single.name;
//     } else {
//       print("file null");
//     }
//   }

//   Widget buildDropFile(BuildContext context) => Builder(
//         builder: (context) => DropzoneView(
//           operation: DragOperation.copy,
//           cursor: CursorType.grab,
//           onCreated: (ctrl) => dropZoneViewController = ctrl,
//           // onLoaded: () => print('Zone 1 loaded'),
//           onError: (ev) {
//             print('Drop file error error: $ev');
//           },
//           onHover: () {
//             state.isDropHover.value = true;
//           },
//           onLeave: () {
//             state.isDropHover.value = false;
//           },
//           onDrop: (ev) async {
//             // print('Zone 1 drop: ${ev.name}');
//             state.subCageryFileName.value = ev.name;
//             state.isDropHover.value = false;
//             // final bytes = await controller1.getFileData(ev);
//           },
//           onDropInvalid: (ev) {
//             print('Drop file invalid MIME: $ev');
//           },
//           onDropMultiple: (ev) async {
//             print(' drop file multiple: $ev');
//           },
//         ),
//       );
// }
