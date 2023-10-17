import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:notary_ping/src/utility/TextFieldName.dart';
import 'package:notary_ping/src/utility/TextFieldPassword.dart';

import '../../../../styles.dart';
import '../../../utility/TextField.dart';
import 'ChartTile.dart';


class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  Duration upRowDelay = const Duration(milliseconds: 500);
  Duration listDelay = const Duration(milliseconds: 350);
  bool isSearchVisible = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white

        ),
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
                  const SizedBox(),
                  if (isSearchVisible)
                    const Expanded(
                      child: CommonTextField(
                        hintText: 'Search here',
                        prefixIcon: Icon(Icons.search),
                       ),
                    )
                  else
                    DelayedDisplay(
                      delay: upRowDelay,
                      slidingBeginOffset: const Offset(1.0, 0.0),
                      slidingCurve: Curves.ease,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 1,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 5,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Opacity(
                                opacity: 0.8,
                                child: Text(
                                  "Messages ",
                                  style: TextStyles.normalHeading,
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
                          setState(() {
                            isSearchVisible = !isSearchVisible;
                          });
                        },
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.2),
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
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )

            ),
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
                            // pushNewScreen(
                            //   context,
                            //   screen: const ChatUi(),
                            //   withNavBar: false,
                            //   pageTransitionAnimation:
                            //   PageTransitionAnimation.fade,
                            // );
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
      ),
    );
  }
}
