// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../../styles.dart';

class SendMoneyBubble extends StatefulWidget {
  final String messageType;
  final String messageContent;
  const SendMoneyBubble(
      {super.key, required this.messageType, required this.messageContent});

  @override
  State<SendMoneyBubble> createState() => _SendMoneyBoubleState();
}

class _SendMoneyBoubleState extends State<SendMoneyBubble> {
  @override
  Widget build(BuildContext context) {
    if (widget.messageType == "sender") {
      return Padding(
        padding: const EdgeInsets.only(left: 7, right: 7, top: 10, bottom: 10),
        child: Align(
          alignment: (widget.messageType == "receiver"
              ? Alignment.topLeft
              : Alignment.topRight),
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: (widget.messageType == "receiver")
                  ? const BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))
                  : const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
              color: (widget.messageType == "receiver")
                  ? Palette.blue3
                  : Palette.blue2,
            ),
            padding:
                const EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("\$${widget.messageContent}",
                          style: TextStyles.normalHeading),
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5, top: 10),
                          child: Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 20,
                          ),
                        ),
                        Text("Send Securely",
                            style: TextStyles.chatOnlineTyping),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 0, top: 10),
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 32,
                  right: -7,
                  child: Container(
                      height: 1,
                      width: 200 - 30,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      )),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 7, right: 7, top: 10, bottom: 10),
        child: Align(
          alignment: (widget.messageType == "receiver"
              ? Alignment.topLeft
              : Alignment.topRight),
          child: Container(
            width: 210,
            decoration: BoxDecoration(
              borderRadius: (widget.messageType == "receiver")
                  ? const BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))
                  : const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
              color: (widget.messageType == "receiver")
                  ? Palette.blue3
                  : Palette.blue2,
            ),
            padding:
                const EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("\$${widget.messageContent}",
                          style: TextStyles.bodyText),
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5, top: 10),
                          child: Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 20,
                          ),
                        ),
                        Text("Received Instantly",
                            style: TextStyles.chatOnlineTyping),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 0, top: 10),
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 32,
                  right: -7,
                  child: Container(
                      height: 1,
                      width: 200 - 30,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      )),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
