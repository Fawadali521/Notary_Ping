
import 'package:flutter/material.dart';

import '../../../../styles.dart';
class ChatInbox extends StatefulWidget {
  const ChatInbox({Key? key}) : super(key: key);

  @override
  State<ChatInbox> createState() => _ChatInboxState();
}

class _ChatInboxState extends State<ChatInbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
         children: [

           // Name row
           Padding(
             padding: const EdgeInsets.only(
               top: 10,
               left: 20,
               right: 20,
               bottom: 20
             ),
             child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                    icon: const Icon(Icons.arrow_back_ios , color: Colors.black,)),

                CircleAvatar(
                  radius: 20,
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
                  padding: const EdgeInsets.only(
                    left: 10
                  ),
                  child: Text("John thomas", style: TextStyles().appBarTitleBlack,),
                )

              ],
          ),
           ),

           // Messages

        ],
      ),

    );
  }
}
