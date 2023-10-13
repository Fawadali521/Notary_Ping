import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notary_ping/src/modules/auth/ForgotPassword.dart';
import 'package:notary_ping/src/modules/auth/OtpVerification.dart';
import 'package:notary_ping/src/modules/auth/SignUp.dart';
import 'package:notary_ping/src/modules/dashboard/DashboardScreen.dart';
import 'package:notary_ping/src/utility/SocialButton.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';
import 'package:notary_ping/src/utility/TextFieldEmail.dart';
import 'package:notary_ping/src/utility/TextFieldPassword.dart';
import 'package:notary_ping/styles.dart';
import 'package:page_transition/page_transition.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        children: [
          const SafeArea(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo/full-logo.png",
                  fit: BoxFit.contain,
                  width: width - 40,
                  height: height * 0.08,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 25,
            ),
            child: Text(
              "Let's\nSign You In!",
              style: TextStyles.authTitleHeadingBlack,
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 15), child: TextFieldEmail()),
          const Padding(
              padding: EdgeInsets.only(bottom: 15), child: PasswordField()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: const ForgotPassword()));
                },
                child: const Text("Forgot password?",
                    style: TextStyles.normalHeading),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const SignUp()));
                  },
                  child:
                      const Text("SIGN UP!", style: TextStyles.normalHeading)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SubmitButton(
              color: Palette.primaryColor,
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: const Dashboard()));
              },
              title: "SIGN IN",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (width - 40) / 2 - 30,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderStyles.norm,
                  ),
                ),
                const Opacity(
                  opacity: 0.5,
                  child: Text(
                    "OR",
                    style: TextStyles.normalHeading,
                  ),
                ),
                Container(
                  width: (width - 40) / 2 - 30,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderStyles.norm,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SocialButton(
              onTap: () {},
              status: "AP",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: SocialButton(
              onTap: () {},
              status: "GO",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'By Signing In, you accept our ',
                  style: TextStyles().privacyBLack,
                ),
                TextSpan(
                    text: ' Terms Of Service',
                    style: TextStyles().privacySecondaryColor,
                    recognizer: TapGestureRecognizer()..onTap = () {}),
                TextSpan(
                  text: ' and ',
                  style: TextStyles().privacyBLack,
                ),
                TextSpan(
                    text: 'Privacy Policy.',
                    style: TextStyles().privacySecondaryColor,
                    recognizer: TapGestureRecognizer()..onTap = () {}),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
