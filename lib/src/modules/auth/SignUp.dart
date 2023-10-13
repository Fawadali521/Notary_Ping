import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
 import 'package:notary_ping/src/utility/SocialButton.dart';
import 'package:notary_ping/src/utility/StateDropDown.dart';
import 'package:notary_ping/src/utility/TextFieldEmail.dart';
import 'package:notary_ping/src/utility/TextFieldName.dart';
import 'package:page_transition/page_transition.dart';

import '../../../styles.dart';
import '../../utility/CityDropDown.dart';
import '../../utility/SubmitButton.dart';
import '../../utility/TextField.dart';
import '../../utility/TextFieldPassword.dart';
import 'OtpVerification.dart';
import 'SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
   PageController pageController = PageController(initialPage: 0);
  int currentPage = 0; // Current page index

  DateTime? selectedDate; // Add selectedDate variable

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
              "Let's\nSign You Up!",
              style: TextStyles.authTitleHeadingBlack,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            child: Container(
              height: 43,
              decoration: BoxDecoration(
                borderRadius: BorderStyles.buttonRadius,
                border: Border.all(
                  color: Palette.primaryColor,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = 0; // Set the current page to 0 (Notary)
                        });
                        pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: currentPage == 0
                              ? Palette.primaryColor // Selected tab color
                              : Colors.white, // Inactive tab color
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                        ),
                        child: Center(
                          child: Text("User",
                              style: currentPage == 0
                                  ? TextStyles.buttonText
                                  : TextStyles.buttonTextBlack),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = 1; // Set the current page to 0 (Notary)
                        });
                        pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: currentPage == 1
                              ? Palette.primaryColor // Selected tab color
                              : Colors.white, // Inactive tab color
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Notary",
                            style: TextStyles.buttonText.copyWith(
                              fontWeight: FontWeight.w200,
                              color: currentPage == 1
                                  ? Colors.white // Selected tab text color
                                  : Colors.black, // Inactive tab text color
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: ExpandablePageView(
              controller: pageController,
              children: [
                userContent(),
                notaryContent(context),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Opacity(
                  opacity: 0.5,
                  child: Text("Already have an account?",
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
                    child:
                        const Text("SIGN IN", style: TextStyles.normalHeading)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SubmitButton(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: OtpVerification()));
              },
              title: "Continue",
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
                  text: 'By Signing Up, you accept our ',
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

Widget userContent() {
  return ListView(

    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    children: const [
      Padding(padding: EdgeInsets.only(bottom: 15), child: TextFieldName()),
      Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: TextFieldEmail(),
      ),
      Padding(padding: EdgeInsets.only(bottom: 15), child: PasswordField()),
    ],
  );
}

Widget notaryContent(BuildContext context) {
  return ListView(
    padding: const EdgeInsets.only(top: 10),
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    children: [
      const Padding(
          padding: EdgeInsets.only(bottom: 10), child: TextFieldName()),
      const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: TextFieldEmail()),
      const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CityDropDown(),
              StateDropDown()],
          )),
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFieldWidget(
          hintText: 'Select commission expiry date',
          prefixIcon: const Icon(
            Icons.calendar_month,
            color: Palette.primaryColor,
          ),
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 10),
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData.light(),
                  child: child!,
                );
              },
            );

            if (pickedDate != null) {
              // Handle the selected date
              print("Selected Date: $pickedDate");
            }
          },
        ),
      ),
      const Padding(
          padding: EdgeInsets.only( bottom: 10), child: PasswordField(

      )),
    ],
  );
}
