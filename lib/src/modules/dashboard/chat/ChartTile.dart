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
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 27,
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width - 60 - 54 - 100,
                              child: const Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Shivay Kumar",
                                      style: TextStyles.bodyText
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Opacity(
                              opacity: 0.5,
                              child: Text(
                                "11:54 AM",
                                style: TextStyles.hintText,
                              ),
                            ),
                          ],
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
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 2, right: 2),
                                                    child: Image.asset(
                                                      "assets/icon/email.png",
                                                      width: 18,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  )),
                                              TextSpan(
                                                text:
                                                'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document',
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
                                    backgroundColor: Palette.blue2,
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
                    Positioned(
                      bottom: -15,
                      child: Container(
                        width: width - 60 - 54,
                        height: 1,
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
    );
  }
}
