

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
 import 'package:notary_ping/src/controller/auth_controller.dart';
import 'package:page_transition/page_transition.dart';

import '../../../styles.dart';
import '../../utility/SubmitButton.dart';
 import '../../utility/text_field.dart';
import 'OtpVerification.dart';
import 'Signin.dart';


//Asimkhan1122
class SignUp extends StatelessWidget {
    SignUp({Key? key}) : super(key: key);


  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 90.0, bottom: 30, left: 20, right: 20),
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
                  padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
                  child: Text(
                    "Register",
                    style: TextStyles.heading1,
                  ),
                ),

                const Padding(
                  padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Text(
                    "Create your account now",
                    style: TextStyles.bodyText,
                  ),
                ),


                // tab bar
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                    left: 50,
                    right: 50
                  ),
                  child: Container(
                    height: 50,
                     decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.5),
                           spreadRadius: 1, // Use responsive_sizer for spreadRadius
                           blurRadius: 1, // Use responsive_sizer for blurRadius
                           offset: const Offset(0, 1),
                         ),
                       ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, ),
                      child: TabBar(
                         labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        padding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 6,
                        ), // Use responsive_sizer for padding
                        controller: controller.tabController,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           // Use responsive_sizer for borderRadius
                          color: Palette.primaryColor,
                            shape: BoxShape.rectangle
                        ),
                        tabs:   [
                          Tab(

                              text: 'Notary ',


                          ),
                          Tab(text: 'User'),


                        ],
                      ),
                    ),
                  ),
                ),
                
                
                SizedBox(
                  height: height * 0.7,
                  child: TabBarView(
                    controller: controller.tabController,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                   children: [

                     const Padding(
                       padding:
                       EdgeInsets.only(left: 20, right: 20, bottom: 10),
                       child: Text(
                         "Full Name",
                         style: TextStyles.normalHeading,
                       ),
                     ),
                     Padding(
                         padding:
                         const EdgeInsets.only(top :5,left: 20.0, right: 20, bottom: 10),
                         child: TextFieldWidget(
                           hintText: 'Email',
                         )
                     ),


// commission expiration date
                     const Padding(
                       padding:
                       EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                       child: Text(
                         "Commission expiration date",
                         style: TextStyles.normalHeading,
                       ),
                     ),
                     Padding(
                         padding:
                         const EdgeInsets.only(top :5,left: 20.0, right: 20, bottom: 10),
                         child: TextFieldWidget(
                           hintText: 'Expiry date',
                           suffixIcon: Icon(Icons.calendar_month),
                         )
                     ),


//city
                     const Padding(
                       padding:
                       EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                       child: Text(
                         "City",
                         style: TextStyles.normalHeading,
                       ),
                     ),
                     Padding(
                         padding:
                         const EdgeInsets.only(top :5,left: 20.0, right: 20, bottom: 10),
                         child: TextFieldWidget(
                           hintText: 'City',
                           suffixIcon: Icon(Icons.arrow_drop_down_sharp,size: 30,),
                         )
                     ),

// state
                     const Padding(
                       padding:
                       EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                       child: Text(
                         "State",
                         style: TextStyles.normalHeading,
                       ),
                     ),
                     Padding(
                         padding:
                         const EdgeInsets.only(top :5,left: 20.0, right: 20, bottom: 10),
                         child: TextFieldWidget(
                           hintText: 'State',
                           suffixIcon: Icon(Icons.arrow_drop_down_sharp,size: 30,),
                         )
                     ),
                     const Padding(
                       padding:
                       EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                       child: Text(
                       "Email",
                       style: TextStyles.normalHeading,
                       ),
                     ),
                     Padding(
                       padding:
                       const EdgeInsets.only(top :5,left: 20.0, right: 20, bottom: 10),
                       child: TextFieldWidget(
                         hintText: 'Email',
                         suffixIcon: Icon(Icons.email_outlined),
                       )
                     ),


                     const Padding(
                       padding:
                       EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                       child: Text(
                       "Password",
                       style: TextStyles.normalHeading,
                       ),
                     ),
                     Padding(
                       padding:
                       const EdgeInsets.only(top :5,left: 20.0, right: 20, bottom: 10),
                       child: TextFieldWidget(
                         hintText: 'Password',
                         suffixIcon: Icon(Icons.visibility_off),
                       )
                     ),

                   ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                   children: [

                     const Padding(
                       padding:
                       EdgeInsets.only(left: 20, right: 20, bottom: 10),
                       child: Text(
                         "Full Name",
                         style: TextStyles.normalHeading,
                       ),
                     ),
                     Padding(
                         padding:
                         const EdgeInsets.only(top :5,left: 20.0, right: 20, bottom: 10),
                         child: TextFieldWidget(
                           hintText: 'Email',
                         )
                     ),





                     const Padding(
                       padding:
                       EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                       child: Text(
                       "Email",
                       style: TextStyles.normalHeading,
                       ),
                     ),
                     Padding(
                       padding:
                       const EdgeInsets.only(top :5,left: 20.0, right: 20, bottom: 10),
                       child: TextFieldWidget(
                         hintText: 'Email',
                         suffixIcon: Icon(Icons.email_outlined),
                       )
                     ),


                     const Padding(
                       padding:
                       EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                       child: Text(
                       "Password",
                       style: TextStyles.normalHeading,
                       ),
                     ),
                     Padding(
                       padding:
                       const EdgeInsets.only(top :5,left: 20.0, right: 20, bottom: 10),
                       child: TextFieldWidget(
                         hintText: 'Password',
                         suffixIcon: Icon(Icons.visibility_off),
                       )
                     ),

                   ],
                      ),

                    ],
                  ),
                ),
                



                Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                    right: 10,
                    left: 10
                  ),
                  child: Row(
                    children: [
                      Obx(
                            () => Checkbox(
                              activeColor: Palette.primaryColor,
                          value: controller.isChecked.value,
                          onChanged: (newValue) {
                            // Call the toggleCheckbox function to update the checkbox state
                            controller.toggleCheckbox();
                          },
                        ),
                      ),                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: <TextSpan>[
                            const TextSpan(
                              text: 'I agree with ',
                              style: TextStyles.bodyText,
                            ),
                            TextSpan(
                                text: 'Terms and condition',
                                style: TextStyles.bodyText.copyWith(
                                    color: Palette.primaryColor,
                                    fontWeight: FontWeight.bold
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.push(
                                    //     context,
                                    //     PageTransition(
                                    //         type: PageTransitionType.fade,
                                    //         child: const TermsConditions()));
                                  }),

                          ]),
                        ),
                      ),
                    ],
                  ),
                ),



                 Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20.0, right: 20),
                  child: SubmitButton(
                    color: Palette.secondaryColor,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child:   OtpVerification()));
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
                      Text(
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
                      const TextSpan(
                        text: 'Have an account. ',
                        style: TextStyles.bodyText,
                      ),
                      TextSpan(
                          text: 'Sign in',
                          style: TextStyles.bodyText.copyWith(
                              color: Palette.primaryColor,
                              fontWeight: FontWeight.bold
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const SignIn()));
                            }),
                     ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
