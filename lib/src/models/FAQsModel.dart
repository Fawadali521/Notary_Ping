// ignore_for_file: prefer_initializing_formals, file_names

class FAQsModel {
  String? id;
  String? question;
  String? answer;
  bool? isShowAnswer;

  FAQsModel({this.id, this.question, this.answer, this.isShowAnswer});

  FAQsModel.fromJson(json, id) {
    this.id = id;
    question = json['question'];
    answer = json['answer'];
    isShowAnswer = false;
  }
}
