import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:notary_ping/src/controller/auth_controller.dart';
import 'package:notary_ping/src/utility/SocialButton.dart';
import 'package:notary_ping/src/utility/TextFieldEmail.dart';
import 'package:page_transition/page_transition.dart';

import '../../../styles.dart';
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
  final AuthController controller = Get.put(AuthController());
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
        children: [
          const SafeArea(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 30,
              left: 20,
              right: 20,
            ),
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
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
            child: Text(
              "Register",
              style: TextStyles.heading1,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              "Create your account now",
              style: TextStyles.bodyText,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 15, right: 20, left: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderStyles.buttonRadius,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
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
                          child: Text(
                            "User",
                            style: TextStyles.buttonText.copyWith(
                              fontWeight: FontWeight.bold,
                              color: currentPage == 0
                                  ? Colors.white // Selected tab text color
                                  : Colors.black, // Inactive tab text color
                            ),
                          ),
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
          ExpandablePageView(
            controller: pageController,
            children: [
              userContent(),
              notaryContent(context),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Already have an account?",
                    style: TextStyles.normalHeading.copyWith(fontSize: 14)),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const SignIn()));
                    },
                    child: Text("SIGN In",
                        style:
                            TextStyles.normalHeading.copyWith(fontSize: 14))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20.0, right: 20),
            child: SubmitButton(
              color: Palette.secondaryColor,
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: OtpVerification()));
              },
              title: "Register",
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
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
            child: SocialButton(
              onTap: () {},
              status: "AP",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 30),
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
                  text: 'By Signing Up, you accept our ',
                  style: TextStyles.bodyText.copyWith(fontSize: 14),
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
                  style: TextStyles.bodyText.copyWith(fontSize: 14),
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

Widget userContent() {
  return ListView(
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Text(
          "Name",
          style: TextStyles.normalHeading,
        ),
      ),
      const Padding(
          padding: EdgeInsets.only(top: 5, left: 20.0, right: 20, bottom: 10),
          child: TextFieldEmail(
            hint: 'Enter your Name',
          )),
      const Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
        child: Text(
          "Email",
          style: TextStyles.normalHeading,
        ),
      ),
      Padding(
        padding:
            const EdgeInsets.only(top: 5, left: 20.0, right: 20, bottom: 10),
        child: TextFieldEmail(
          hint: 'Enter you email ',
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
        child: Text(
          "Password",
          style: TextStyles.normalHeading,
        ),
      ),
      Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 20.0, right: 20, bottom: 10),
          child: PasswordField()),
    ],
  );
}

Widget notaryContent(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Text(
          "Name",
          style: TextStyles.normalHeading,
        ),
      ),
      const Padding(
          padding: EdgeInsets.only(top: 5, left: 20.0, right: 20, bottom: 10),
          child: TextFieldEmail(
            hint: 'Enter your name ',
          )),

      //email
      const Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
        child: Text(
          "Email",
          style: TextStyles.normalHeading,
        ),
      ),
      const Padding(
          padding: EdgeInsets.only(top: 5, left: 20.0, right: 20, bottom: 10),
          child: TextFieldEmail(
            hint: 'Enter you email ',
          )),
      // city
      const Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
        child: Text(
          "City",
          style: TextStyles.normalHeading,
        ),
      ),
      const Padding(
          padding: EdgeInsets.only(top: 5, left: 20.0, right: 20, bottom: 10),
          child: TextFieldWidget(
            hintText: 'City',
            suffixIcon: Icon(
              Icons.arrow_drop_down_sharp,
              size: 30,
            ),
          )),
// state

      const Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
        child: Text(
          "State",
          style: TextStyles.normalHeading,
        ),
      ),
      const Padding(
          padding: EdgeInsets.only(top: 5, left: 20.0, right: 20, bottom: 10),
          child: TextFieldWidget(
            hintText: 'State',
            suffixIcon: Icon(
              Icons.arrow_drop_down_sharp,
              size: 30,
            ),
          )),

// commission expiration date
      const Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
        child: Text(
          "Commission expiration date",
          style: TextStyles.normalHeading,
        ),
      ),
      Padding(
        padding:
            const EdgeInsets.only(top: 5, left: 20.0, right: 20, bottom: 10),
        child: TextFieldWidget(
          hintText: 'Expiry date',
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
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
        child: Text(
          "Password",
          style: TextStyles.normalHeading,
        ),
      ),
      Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 20.0, right: 20, bottom: 10),
          child: PasswordField()),
    ],
  );
}
