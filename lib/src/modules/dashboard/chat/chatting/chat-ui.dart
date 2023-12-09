// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notary_ping/src/modules/dashboard/chat/chatting/request-money-bubble.dart';
import 'package:notary_ping/src/modules/dashboard/chat/chatting/send-money-bubble.dart';

import '../../../../../styles.dart';
import '../../../../utility/datas.dart';
import 'chat-bubble.dart';
import 'chat-meassage.dart';
import 'chat-msg-input.dart';

class ChatUi extends StatefulWidget {
  const ChatUi({super.key});

  @override
  State<ChatUi> createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {
  var messages = Datas().messages.reversed.toList();
  Duration scrollDelay = const Duration(milliseconds: 500);
  String? typeMsg;
  final ScrollController scrollController = ScrollController();
  bool isTyping = false;

  void handleTextFieldChanged(String text) {
    setState(() {
      isTyping = text.isNotEmpty;
    });
  }

  scrollDown() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: scrollDelay,
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.secondaryColor,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        centerTitle: false,
        leadingWidth: 25,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              scrollDown();
              if (kDebugMode) {
                print("Scroll");
              }
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/images/profileImage.png"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Shivay Kumar",
                      style: TextStyles.chatPersonName,
                    ),
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        isTyping ? "typing..." : "online",
                        style: TextStyles.chatOnlineTyping,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Palette.secondaryColor, Palette.primaryColor],
              end: Alignment.centerRight,
              begin: Alignment.centerLeft,
            ),
          ),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              reverse: true,
              padding: const EdgeInsets.only(top: 10, bottom: 100),
              controller: scrollController,
              itemBuilder: (context, index) {
                final reversedIndex = messages.length - 1 - index;

                if (messages[reversedIndex].sendMoney != true &&
                    messages[reversedIndex].requestMoney != true) {
                  return ChatBubble(
                    messageType: messages[reversedIndex].messageType,
                    messageContent: messages[reversedIndex].messageContent,
                  );
                }
                if (messages[reversedIndex].sendMoney == true) {
                  return SendMoneyBubble(
                    messageType: messages[reversedIndex].messageType,
                    messageContent: messages[reversedIndex].messageContent,
                  );
                }
                if (messages[reversedIndex].requestMoney == true) {
                  return RequestMoneyBubble(
                    sendMoney: () {
                      sendMoney(messages[reversedIndex].messageContent);
                    },
                    isMedia: messages[reversedIndex].isMedia,
                    messageType: messages[reversedIndex].messageType,
                    messageContent: messages[reversedIndex].messageContent,
                  );
                }
                return null;
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: ChatMsgInput(requestMoney: () {
                  requestMoney(typeMsg);
                }, sendMoney: () {
                  sendMoney(typeMsg);
                }, sendMessage: () {
                  sendMessage(typeMsg);
                }, onChanged: (value) {
                  handleTextFieldChanged(value);
                  setState(() {
                    typeMsg = value;
                  });
                }, tap: () {
                  scrollDown();
                })),
          ],
        ),
      ),
    );
  }

  void sendMessage(String? content) {
    if (content != null) {
      final newMessage = ChatMessage(
        messageType: "sender",
        isMedia: false,
        time: DateTime.now(),
        isSeen: false,
        sendMoney: false,
        requestMoney: false,
        messageContent: content,
      );
      setState(() {
        messages.add(newMessage);
        typeMsg = null;
      });
    }
  }

  void sendMoney(String? content) {
    if (content != null) {
      // pushNewScreen(
      //   context,
      //   screen: EnterMasterPin(
      //       navigatePage: PaymentSuccessful(
      //     amount: content,
      //     name: "Shivay Kumar",
      //   )),
      //   withNavBar: false,
      //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
      final newMessage = ChatMessage(
        messageType: "sender",
        isMedia: false,
        time: DateTime.now(),
        isSeen: false,
        sendMoney: true,
        requestMoney: false,
        messageContent: content,
      );
      setState(() {
        messages.add(newMessage);
        typeMsg = null;
      });
    }
  }

  void requestMoney(String? content) {
    if (content != null) {
      final newMessage = ChatMessage(
        messageType: "sender",
        isMedia: false,
        time: DateTime.now(),
        isSeen: false,
        sendMoney: false,
        requestMoney: true,
        messageContent: content,
      );
      setState(() {
        messages.add(newMessage);
        typeMsg = null;
      });
    }
  }
}
