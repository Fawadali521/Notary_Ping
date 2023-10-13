import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notary_ping/src/modules/auth/SignIn.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';
import 'package:notary_ping/src/utility/TextFieldEmail.dart';
import 'package:page_transition/page_transition.dart';

import '../../../styles.dart';
import 'OtpVerification.dart';
import 'SignUp.dart';

//Asimkhan1122
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        children: [
          const SafeArea(child: SizedBox()),
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
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              'Forgot Password?',
              style: TextStyles.authTitleHeadingBlack,
            ),
          ),
            const Padding(
            padding: EdgeInsets.only(

              bottom: 20
            ),
            child: Text(
              'Please enter your email address,'
                  ' and we will send you OTP for reset.',
              textAlign: TextAlign.center,
              style: TextStyles.bodyText,
            ),
          ),
           const Padding(
             padding: EdgeInsets.only(
                top: 10,
               bottom: 20
             ),
             child: TextFieldEmail(
             ),
           ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const SignUp()));
                  },
                  child: const Text("Sign Up",
                      style: TextStyles.normalHeading),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const SignIn()));
                    },
                    child: const Text("Try Sign In",
                        style: TextStyles.normalHeading)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 20
            ),
            child: SubmitButton(onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: OtpVerification()));
            }, title: 'SEND'),
          ),

        ],
      ),
    );
  }
}
