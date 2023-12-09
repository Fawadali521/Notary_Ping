// ignore_for_file: file_names

class ChatMessage {
  String messageContent;
  String messageType;
  bool isMedia;
  DateTime time;
  bool isSeen = false;
  bool sendMoney = false;
  bool requestMoney = false;
  ChatMessage({
    required this.messageContent,
    required this.messageType,
    required this.isMedia,
    required this.time,
    required this.isSeen,
    required this.sendMoney,
    required this.requestMoney,
  });
}
