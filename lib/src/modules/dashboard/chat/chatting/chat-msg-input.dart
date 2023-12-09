// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../../styles.dart';

class ChatMsgInput extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSendPressed;
  final VoidCallback sendMessage;
  final VoidCallback sendMoney;
  final VoidCallback requestMoney;
  final VoidCallback tap;
  const ChatMsgInput(
      {super.key,
      this.onChanged,
      this.onSendPressed,
      required this.sendMessage,
      required this.tap,
      required this.sendMoney,
      required this.requestMoney});

  @override
  State<ChatMsgInput> createState() => _ChatMsgInputState();
}

class _ChatMsgInputState extends State<ChatMsgInput> {
  Duration duration0 = const Duration(milliseconds: 500);
  bool showPayMode = false;
  bool showAttach = true;

  final TextEditingController textController = TextEditingController();
  bool canConvertToInt = false;
  bool canConvertToDouble = false;

  @override
  void initState() {
    super.initState();
    textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    String inputText = textController.text;
    if (inputText.isEmpty) {
      setState(() {
        showAttach = true;
      });
    }
    if (inputText.isNotEmpty) {
      setState(() {
        showAttach = false;
      });
    }
    try {
      int.parse(inputText);
      setState(() {
        showPayMode = true;
      });
    } catch (e) {
      setState(() {
        showPayMode = false;
      });
    }
    try {
      double.parse(inputText);
      setState(() {
        showPayMode = true;
      });
    } catch (e) {
      setState(() {
        showPayMode = false;
      });
    }
  }

  double extraHeight = 95;
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: 55 + extraHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Opacity(
              opacity: 0.9,
              child: AnimatedContainer(
                duration: duration0,
                width: width - 30,
                height: showPayMode ? 55 + extraHeight : 55,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Money Transaction with",
                        style: TextStyles.normalHeading,
                      ),
                      Row(
                        children: [
                          Text(
                            "Name: SHIVAY KUMAR",
                            style: TextStyles.normalHeading,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.security,
                              color: Colors.green,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: AnimatedContainer(
              duration: duration0,
              width: width - 30,
              height: 55,
              decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Palette.blue2, Palette.blue2]),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: showPayMode
                        ? width - 30 - 40 - 10 - 20 - 80 - 10
                        : width - 30 - 40 - 10 - 5,
                    child: TextField(
                      controller: textController,
                      onChanged: widget.onChanged,
                      onTap: widget.tap,
                      autofocus: false,
                      style: TextStyles.normalHeading,
                      cursorColor: Palette.primaryColor,
                      decoration: InputDecoration(
                        prefixIcon: showPayMode
                            ? const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: ImageIcon(
                                    AssetImage("assets/icon/search.png"),
                                    color: Colors.white),
                              )
                            : null,
                        suffixIcon: showAttach
                            ? const Icon(
                                Icons.attachment_sharp,
                                color: Colors.white,
                                size: 20,
                              )
                            : null,
                        isDense: true,
                        hintText: "Type a message",
                        hintStyle: TextStyles.chatCount,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(
                            left: 20, top: 5, bottom: 20, right: 0),
                        // contentPadding:
                        //     const EdgeInsets.only(top: 12, right: 10, left: 10, bottom: 12)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 0.0, top: 10, bottom: 10),
                    child: SizedBox(
                      width: showPayMode ? 60 : 50,
                      child: showPayMode
                          ? InkWell(
                              onTap: () {
                                widget.sendMoney();
                                textController.clear();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Palette.blue2,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Send",
                                    style: TextStyles.normalHeading,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                widget.sendMessage();
                                textController.clear();
                                print("send message");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.1),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Icon(
                                        Icons.send,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                  if (showPayMode)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 10.0, top: 10, bottom: 10),
                      child: SizedBox(
                        width: 80,
                        child: showPayMode
                            ? InkWell(
                                onTap: () {
                                  widget.requestMoney();
                                  textController.clear();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Palette.primaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 1),
                                      child: Text(
                                        "Request",
                                        style: TextStyles.normalHeading,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(0.1),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
