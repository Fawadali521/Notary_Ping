 import 'package:flutter/material.dart';

import '../../../../styles.dart';

class ChatTile extends StatefulWidget {
  final String msgCount;
  const ChatTile({super.key, this.msgCount = '3'});

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 110,
      decoration: const BoxDecoration(
        color: Palette.textFieldFill,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Palette.primaryColor.withOpacity(0.2),
              child: const Center(
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Palette.primaryColor,
                      backgroundImage: AssetImage("assets/images/profileImage.png"),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                width: width - 60 - 54,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width - 60 - 54 - 100,
                                child: const Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "John Thomas",
                                        style: TextStyles.bodyText
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Opacity(
                                opacity: 0.5,
                                child: Text(
                                  "11:54 AM",
                                  style: TextStyles.hintText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width - 60 - 54 - 30,
                                height: 50,
                                child: Row(
                                  children: [
                                    Flexible(
                                        child: RichText(
                                          overflow: TextOverflow.visible,
                                          text: const TextSpan(
                                            children: [
                                               TextSpan(
                                                text:
                                                'Here is text message sent by peoples ',


                                                style: TextStyles.bodyText,
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width: 20,
                                  child: CircleAvatar(
                                    backgroundColor: Palette.primaryColor,
                                    child: Text(
                                      widget.msgCount,
                                      style: TextStyles.bodyText,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                   ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
