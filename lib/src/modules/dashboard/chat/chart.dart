import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:notary_ping/src/modules/dashboard/chat/ChatInbox.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../styles.dart';
import 'ChartTile.dart';
import 'ChatSearch.dart';


class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  Duration upRowDelay = const Duration(milliseconds: 500);
  Duration listDelay = const Duration(milliseconds: 350);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return   Container(
      height: height,
      width: width,
      decoration:   const BoxDecoration(
          gradient:
          LinearGradient(colors: [Palette.secondaryColor, Palette.primaryColor])),
      child: ListView(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          const SafeArea(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 15, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DelayedDisplay(
                  delay: upRowDelay,
                  slidingBeginOffset: const Offset(-1.0, 0.0),
                  slidingCurve: Curves.ease,
                  child:   Text(
                    "Chat",
                    style: TextStyles().appBarTitleWhite,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DelayedDisplay(
                      delay: upRowDelay,
                      slidingBeginOffset: const Offset(1.0, 0.0),
                      slidingCurve: Curves.ease,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              width: 1,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child:   Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Opacity(
                                opacity: 0.8,
                                child: Text(
                                  "New Group ",
                                  style: TextStyles().appBarTitleWhite,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(),
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: DelayedDisplay(
                        delay: upRowDelay,
                        slidingBeginOffset: const Offset(1.0, 0.0),
                        slidingCurve: Curves.ease,
                        child: InkWell(
                          onTap: () {
                            //TODO

                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child:   const ChatSearch()));


                          },
                          child: Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.5),
                                width: 1,
                              ),
                              color: Colors.transparent,
                            ),
                            child: Center(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Image.asset(
                                    "assets/icon/search.png",
                                    width: 20,
                                    fit: BoxFit.contain,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //       left: 20, right: 20, top: 15, bottom: 20),
          //   child: SizedBox(
          //     height: 40,
          //     child: TextFieldSearch(
          //       onChanged: (x) {},
          //       hint: 'Search People',
          //     ),
          //   ),
          // ),
          Container(
            width: width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: ListView.builder(
              itemCount: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 50),
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: listDelay,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child:   ChatInbox()));


                        },
                        child: ChatTile(
                          msgCount: (index + 1).toString(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
