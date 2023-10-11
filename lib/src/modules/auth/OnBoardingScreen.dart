import 'dart:async';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notary_ping/Infos.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';
import 'package:notary_ping/styles.dart';
import 'package:page_transition/page_transition.dart';

import 'SignIn.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController? controller;
  Timer? timer;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      if (currentIndex < Infos.contents.length - 1) {
        controller?.animateToPage(
          currentIndex + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      } else {
        controller?.jumpToPage(
          0,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.25),
                child: Stack(
                  children: [
                    ExpandablePageView(
                      controller: controller,
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      children: [
                        ...List.generate(
                            Infos.contents.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 45),
                                            child: Image.asset(
                                              Infos.contents[index][
                                                  'image']!, // Access the 'image' key from the map at index i
                                              height: height * 0.2,
                                              width: width - 40,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20, bottom: 10),
                                        child: Center(
                                          child: Text(
                                              Infos.contents[index]['title']!,
                                              textAlign: TextAlign.center,
                                              style: TextStyles.heading1),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20, bottom: 0),
                                        child: Text(
                                          Infos.contents[index]['description']!,
                                          textAlign: TextAlign.center,
                                          style: TextStyles.bodyText.copyWith(
                                              color: Colors.black
                                                  .withOpacity(0.8)),
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                      ],
                    ),
                    Positioned(
                      top: height * 0.2 + 15,
                      child: SizedBox(
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            Infos.contents.length,
                            (index) => buildDot(index, context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: SizedBox(
                  height: 45,
                  child: SubmitButton(
                    title: 'Continue',
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const SignIn()));
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 12,
      width: currentIndex == index ? 12 : 12,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.white : Palette.primaryColor,
        border: Border.all(color: Palette.primaryColor, width: 3),
      ),
    );
  }
}
