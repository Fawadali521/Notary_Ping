
import 'package:flutter/material.dart';

import '../../../../styles.dart';


import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'chatting/chat-meassage.dart';



class ChatInbox extends StatefulWidget {
  const ChatInbox({super.key});

  @override
  ChatInboxState createState() => ChatInboxState();
}

class ChatInboxState extends State<ChatInbox> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text, String sender) {
    _textController.clear();
    ChatMessage message = ChatMessage(

       requestMoney: true, sendMoney: true,
      isSeen: false, time: DateTime.now(), isMedia: false, messageType: 'sender', messageContent: '',
    );
    setState(() {
      _messages.insert(0, message);
    });
   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10
          ),
          child: Column(
            children: [
              // Name row
              Padding(
                padding: const EdgeInsets.only(
                    top: 20,
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
              Flexible(
                child: ListView.builder(
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (_, int index) => Container(),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(
                   bottom: 10,
                   left: 10,
                   right: 10

                 ),
                 child: Container(
                   height: 40,
                   decoration: const BoxDecoration(
                     color: Palette.primaryColor,
                     borderRadius: BorderStyles.norm


                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(Icons.arrow_upward,color: Colors.white,),
                       Text('Add Documents', style: TextStyles.buttonText,),
                     ],
                   ),
                 ),
               ),
               Padding(
                padding: const EdgeInsets.only(bottom:20, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey
                    ),
                    borderRadius: BorderStyles.norm,
                      color: Palette.textFieldFill),
                  child: _buildTextComposer(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: const IconThemeData(color: Palette.primaryColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                style: TextStyles.textField,
                controller: _textController,
                onSubmitted: (text) => _handleSubmitted(text, 'User 1'),
                decoration: const InputDecoration.collapsed(
                  hintText: 'Send a message',
                  hintStyle: TextStyles.textField
                ),
              ),
            ),
            IconButton(onPressed: (){},
              icon: const Icon(Icons.mic),            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text, 'User 1'),
            ),
          ],
        ),
      ),
    );
  }
}

// class ChatMessage extends StatelessWidget {
//   final String text;
//   final String sender;
//
//   const ChatMessage({super.key,
//     required this.text,
//     required this.sender,
//   m,
//     required bool requestMoney,
//     required bool sendMoney, required bool isSeen,
//     required DateTime time, required bool isMedia, required String messageType, required String messageContent,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final isUser1 = sender == 'User 1';
//
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         mainAxisAlignment: isUser1 ? MainAxisAlignment.end : MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//
//           Container(
//             margin: EdgeInsets.only(left: isUser1 ? 8.0 : 0, right: isUser1 ? 0 : 8.0),
//             padding: const EdgeInsets.all(10.0),
//             decoration: BoxDecoration(
//               color: isUser1 ? Colors.blue : Colors.grey,
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(text, style: TextStyle(color: Colors.white)),
//               ],
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: CircleAvatar(
//               radius: 20,
//               backgroundColor: Palette.primaryColor.withOpacity(0.2),
//               child: const Center(
//                 child: CircleAvatar(
//                   radius: 26,
//                   backgroundColor: Colors.white,
//                   child: Center(
//                     child: CircleAvatar(
//                       radius: 25,
//                       backgroundColor: Palette.primaryColor,
//                       backgroundImage: AssetImage("assets/images/profileImage.png"),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//      //super.dispose();
//   }
// }



