 import 'package:flutter/cupertino.dart';

import '../../../../../styles.dart';

class ChatBubble extends StatefulWidget {
  final String messageType;
  final String messageContent;
  const ChatBubble(
      {super.key, required this.messageType, required this.messageContent});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7, top: 5, bottom: 5),
      child: Align(
        alignment: (widget.messageType == "receiver"
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: width * 0.8,
          ),
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
                ? Palette.primaryColor
                : Palette.blue2,
          ),
          padding: const EdgeInsets.all(12),
          child: Text(widget.messageContent, style: TextStyles.normalHeading),
        ),
      ),
    );
  }
}
