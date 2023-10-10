import 'dart:async';

import 'package:flutter/material.dart';
 import 'package:notary_ping/src/modules/auth/SignIn.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';
 import 'package:page_transition/page_transition.dart';

import '../../../Infos.dart';
import '../../../styles.dart';

// Asimkhan1122
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
        controller?.nextPage(
          duration: const Duration(milliseconds:500),
          curve: Curves.easeInOut,
        );
      } else {
        controller?.jumpToPage(0); // Loop back to the first page
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: Infos.contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom:10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Padding(
                         padding: const EdgeInsets.only(
                             left: 20, right: 20, bottom: 30                         ),
                         child: Image.asset(
                          Infos.contents[i]['image']!, // Access the 'image' key from the map at index i
                          height: height * 0.2,
                      ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(
                             left: 20.0, right: 20, bottom: 10
                         ),
                         child: Center(
                           child: Text(Infos.contents[i]['title']!,
                              textAlign: TextAlign.center,
                              style: TextStyles.heading1),
                         ),
                       ),

                       Padding(
                         padding: const EdgeInsets.only(
                            top: 20, left: 20.0, right: 20, bottom: 15
                         ),
                         child: Text(
                          Infos.contents[i]['description']!,
                          textAlign: TextAlign.center,
                          style: TextStyles.bodyText
                              .copyWith(color: Colors.black.withOpacity(0.8)),
                      ),
                       )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                Infos.contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 30,
              left: 40,
              right: 40

            ),
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
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        //todo
        // color: Theme.of(context).primaryColor,
        color: Palette.primaryColor,
      ),
    );
  }
}
