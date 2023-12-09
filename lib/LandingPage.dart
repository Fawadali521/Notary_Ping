// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:notary_ping/src/modules/auth/onboarding/OnBoarding.dart';
import 'package:page_transition/page_transition.dart';

import 'SplashScreen.dart';

//Asimkhan1122
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Duration splashDelay = const Duration(milliseconds: 3000);
  @override
  void initState() {
    Future.delayed(splashDelay).then((value) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: Onboarding(),
        ),
      );
    });
    super.initState();
  }

//
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
