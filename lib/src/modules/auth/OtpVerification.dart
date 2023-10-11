import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notary_ping/src/modules/auth/ResetPassword.dart';
import 'package:notary_ping/src/modules/auth/SignUp.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';

import '../../../styles.dart';

//Asimkhan1122

class OtpVerification extends StatelessWidget {
  OtpVerification({Key? key}) : super(key: key);
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyles.heading1,
    decoration: BoxDecoration(
      borderRadius: BorderStyles.buttonRadius,
      border: Border.all(
        color: Palette.primaryColor,
        width: 1.0, // Adjust the border width as needed
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
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
                  bottom: 20,
                ),
                child: Text(
                  "Kindly\nvalidate with OTP",
                  style: TextStyles.authTitleHeadingBlack,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Center(
                  child: Pinput(
                    length: 4,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme,
                    submittedPinTheme: defaultPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => print(pin),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.7,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'We just sent you SMS with 4 digit code Looks like '
                    'you will be soon logged in',
                    textAlign: TextAlign.center,
                    style: TextStyles().privacyBLack,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
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
                      child: const Text("Wrong Email?",
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
                        child: const Text("SIGN IN!",
                            style: TextStyles.normalHeading)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: SubmitButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const ResetPassword()));
                    },
                    title: 'Verify'),
              ),
              SizedBox(
                height: height * 0.06,
              ),
            ],
          ),
          // SafeArea(
          //   child: Container(
          //     height: 50,
          //     width: 50,
          //     decoration: BoxDecoration(
          //       color: Palette.textFieldFill,
          //       shape: BoxShape.circle,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.01),
          //           spreadRadius: 1,
          //           blurRadius: 1,
          //           offset: const Offset(0, 1),
          //         ),
          //       ],
          //     ),
          //     child: const Center(
          //       child: Padding(
          //         padding: EdgeInsets.only(left: 10),
          //         child: Icon(Icons.arrow_back_ios),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
