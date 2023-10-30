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
    return Padding(
      padding: const EdgeInsets.only(
        top: 10, bottom: 10
      ),
      child: Container(
        height: 110,
        decoration: const BoxDecoration(
         ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: Palette.blue2,
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/profileImage.png"),
                ),
              ),              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: width - 60 - 54,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:  20),
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
                                          style: TextStyles.normalHeading
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
                          Row(
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
                                      style: TextStyles.chatCount,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ],
                          ),
                         ],
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: width - 60 - 54,
                          height: 2,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.05)),
                        ),
                      )

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
