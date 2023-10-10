// Asimkhan1122
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notary_ping/src/modules/auth/OtpVerification.dart';
import 'package:notary_ping/src/modules/auth/SignUp.dart';
import 'package:notary_ping/src/modules/auth/ForgotPassword.dart';
import 'package:page_transition/page_transition.dart';

import '../../../styles.dart';
import '../../utility/SubmitButton.dart';
import '../../utility/TextFieldEmail.dart';
import '../../utility/TextFieldPassword.dart';
import '../../utility/TextField.dart';

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
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          const SafeArea(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, bottom: 30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo/full-logo.png",
                  fit: BoxFit.contain,
                  width: width * 0.6,
                ),
              ],
            ),
          ),
            Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
            child: Text(
              "Let's\nSign You In!",
              style: TextStyles.heading1.copyWith(
                fontWeight: FontWeight.w100
              ),
            ),
          ),
              Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20.0, right: 20, bottom: 10),
              child: TextFieldEmail(
                initialText: 'Enter you email ',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset('assets/images/mail.png',
                    height: 10,
                    width: 10,
                    color: Palette.primaryColor,
                  ),
                ),
              )
            ),

              Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20.0, right: 20, bottom: 15),
              child: PasswordField(
                hint: 'Password',
                prefixIcon: Padding(
                  padding:  const  EdgeInsets.all(12.0),
                  child: Image.asset('assets/images/lock.png',
                    height: 10,
                    width: 10,
                    color: Palette.primaryColor,
                  ),
                ),



              )
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
            child: Row(
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
                  child:
                       Text("Forgot password?", style: TextStyles.normalHeading.copyWith(
                        fontSize: 14
                      )),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: SignUp()));
                    },
                    child: Text("SIGN UP", style: TextStyles.normalHeading.copyWith(
                      fontSize: 14
                    ))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top : 10, left: 20.0, right: 20),
            child: SubmitButton(
              color: Palette.primaryColor,
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: OtpVerification()));
              },
              title: "SIGN IN",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, bottom: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (width - 40) / 2 - 30,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderStyles.norm,
                  ),
                ),
                const Text(
                  "OR",
                  style: TextStyles.bodyText,
                ),
                Container(
                  width: (width - 40) / 2 - 30,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderStyles.norm,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
            child: SocialButton(
              onTap: () {},
              status: "AP",
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20, bottom: 30),
            child: SocialButton(
              onTap: () {},
              status: "GO",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
              left: 15,
              right: 20,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                  TextSpan(
                  text: 'By Signing In, you accept our ',
                  style: TextStyles.bodyText.copyWith(
                    fontSize: 14
                  ),
                ),
                TextSpan(
                    text: ' Terms Of Service',
                    style: TextStyles.bodyText.copyWith(
                        color: Palette.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         type: PageTransitionType.fade,
                        //         child: const TermsConditions()));
                      }),
                  TextSpan(
                  text: ' and ',
                  style: TextStyles.bodyText.copyWith(
                    fontSize: 14
                  ),
                ),
                TextSpan(
                    text: 'Privacy Policy.',
                    style: TextStyles.bodyText.copyWith(
                      fontSize: 14,
                        color: Palette.primaryColor,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         type: PageTransitionType.fade,
                        //         child: const PrivacyPolicy()));
                      }),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String status;
  final VoidCallback onTap;
  const SocialButton({super.key, this.status = "GO", required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: MaterialButton(
        elevation: 0,
        onPressed: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        color: socialColor(status),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderStyles.buttonRadius,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  socialTitle(status),
                  style: TextStyles.buttonText.copyWith(
                    fontSize: 14
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Image.asset(
              socialIcon(status),
              fit: BoxFit.contain,
              height: 24,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  String socialTitle(String status) {
    if (status == "GO") {
      return "Continue With Google";
    }
    if (status == "FB") {
      return "Continue With Facebook";
    } else {
      return "Continue With Apple";
    }
  }

  Color socialColor(String status) {
    if (status == "GO") {
      return Colors.red;
    }
    if (status == "FB") {
      return Colors.blue;
    } else {
      return Colors.black;
    }
  }

  String socialIcon(String status) {
    if (status == "GO") {
      return "assets/images/google.png";
    }
    if (status == "AP") {
      return "assets/images/apple.png";
    } else {
      return "assets/social/apple.png";
    }
  }
}
