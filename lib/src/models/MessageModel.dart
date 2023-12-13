// ignore_for_file: prefer_initializing_formals, file_names

class MessageModel {
  String? id;
  String? imgUrl;
  String? name;
  String? message;
  bool? isOnline;
  bool? isRead;
  bool? isSender;
  String? time;

  MessageModel({
    this.id,
    this.imgUrl,
    this.name,
    this.isOnline,
    this.isRead,
    this.isSender,
    this.time,
    this.message,
  });
}
