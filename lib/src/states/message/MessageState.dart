// ignore_for_file: file_names

import 'package:flutter_slidable_panel/controllers/slide_controller.dart';
import 'package:notary_ping/src/models/MessageModel.dart';

import '../../../index.dart';

class MessageState extends LoadingState {
  final RxList<MessageModel> profiles = [
    MessageModel(
      name: "Fawad Khan",
      message: "Hello there!",
      time: "12:00 PM",
      imgUrl: user,
      isRead: true,
      isSender: false,
      isOnline: true,
    ),
    MessageModel(
      name: "Ruhel Chowdhury",
      message: "No rush, mate! Just let...",
      time: "12:00 PM",
      imgUrl: user,
      isRead: false,
      isSender: false,
      isOnline: false,
    ),
    MessageModel(
      name: "Ruhel Chowdhury",
      message: "No rush, mate! Just let...",
      time: "12:00 PM",
      imgUrl: user,
      isRead: true,
      isSender: true,
      isOnline: true,
    ),
  ].obs;
  final List<SlideController> slideController = [
    SlideController(),
    SlideController(),
    SlideController(),
  ];
}
