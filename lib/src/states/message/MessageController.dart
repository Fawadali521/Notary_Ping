// ignore_for_file: file_names

import 'package:notary_ping/src/states/message/MessageState.dart';

import '../../../index.dart';

class MessageController extends GetxController {
  final state = MessageState();

  changwLodingStatus(bool value) {
    state.isRecording.value = value;
  }
}
