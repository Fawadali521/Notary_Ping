// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../styles.dart';

class ChatSearchTile extends StatefulWidget {
  final bool isContact;
  const ChatSearchTile({super.key, this.isContact = true});

  @override
  State<ChatSearchTile> createState() => _ChatSearchTileState();
}

class _ChatSearchTileState extends State<ChatSearchTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Palette.blue2,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage("assets/images/profileImage.png"),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "@s_paradox",
                    style: TextStyles.hintText,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Opacity(
                      opacity: 0.7,
                      child: Text(
                        "Shiva Kumar",
                        style: TextStyles.bodyText,
                      ),
                    ),
                  ),
                  if (widget.isContact == true)
                    const Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Opacity(
                        opacity: 0.7,
                        child: Text(
                          "Contacts",
                          style: TextStyles.bodyText,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          if (!widget.isContact)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Palette.blue1,
              ),
              child: const Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 3.0, bottom: 4),
                child: Text(
                  "Request",
                  style: TextStyles.requestText,
                ),
              ),
            )
        ],
      ),
    );
  }
}
