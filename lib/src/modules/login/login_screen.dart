


 import 'package:flutter/material.dart';
import 'package:notary_ping/src/modules/forgot_password/forgot_password_screen.dart';
import 'package:notary_ping/src/modules/signup/signup_screen.dart';
import 'package:notary_ping/src/utility/common_button.dart';
import 'package:page_transition/page_transition.dart';

import '../../../styles.dart';
import '../../utility/text_field.dart';

// Asimkhan1122


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return   Scaffold(
      backgroundColor: Palette.blue2,


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              SizedBox(height: height * 0.08,),

              Center(
                child: Image.asset('assets/logo/full-logo.png',
                  height: height * 0.06,
                width: width * 0.6,

                ),
              ),
              SizedBox(height: height * 0.04,),
              Text('Lets \nsign you in!',style: TextStyles.boardingHeading,),
              SizedBox(height: height * 0.04,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),
              const TextFieldWidget(
                hintText: 'Enter password',
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              SizedBox(height: height * 0.02,),
               Row(
                 children: [
                   Checkbox(
                       activeColor: Colors.orange,
                       value: true, onChanged: (v){}),
                   Text('Remember me',style: TextStyles.boardingHeading.copyWith(fontSize: 16),),
                   Spacer(),
                   GestureDetector(
                     onTap: (){
                       Navigator.pushReplacement(
                         context,
                         PageTransition(
                           type: PageTransitionType.fade,
                           child:  const ForgotPasswordScreen(),
                         ),
                       );

                     },

                       child: Text('Forgot Password',style: TextStyles.boardingHeading.copyWith(fontSize: 16),)),

                 ],
               ),
              SizedBox(height: height * 0.02,),
              ElevatedButtonWidget(
                onTap: (){
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child:  const SignUpScreen(),
                    ),
                  );

                },


                buttonText: 'SIGN IN', buttonColor: Colors.orange,),
              SizedBox(height: height * 0.02,),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.0, // Adjust the thickness as needed
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust the padding as needed
                    child: Text(
                      "OR",
                      style: TextStyles.boardingHeading.copyWith(
                        fontSize: 16
                      )
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.0, // Adjust the thickness as needed
                    ),
                  ),



                ],
              ),
              SizedBox(height: height * 0.02,),

              SocialMediaW(),
              SizedBox(height: height * 0.02,),
              SocialMediaW(
                icon: 'assets/images/google.png',
                  title: 'Continue with Google',

                  ),
              SizedBox(height: height * 0.02,),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                   children: <TextSpan>[
                    TextSpan(
                      text: 'By signing in you accept our ',
                      style: TextStyles.boardingHeading.copyWith(fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Term of Services',
                      style: TextStyles.boardingHeading.copyWith(
                        color: Colors.orange,
                          fontSize: 16),
                      // Add a gesture recognizer or onPressed callback for handling the tap
                    ),
                    TextSpan(
                      text: ' and ',
                      style: TextStyles.boardingHeading.copyWith(fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyles.boardingHeading.copyWith(
                          color: Colors.orange,
                          fontSize: 16),
                      // Add a gesture recognizer or onPressed callback for handling the tap
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02,),
               Center(
                 child: RichText(
                   textAlign: TextAlign.center,
                   text: TextSpan(
                     children: <TextSpan>[
                       TextSpan(
                         text: 'Do not have account ',
                         style: TextStyles.boardingHeading.copyWith(fontSize: 16),
                       ),
                       TextSpan(
                         text: 'Sign Up',
                         style: TextStyles.boardingHeading.copyWith(
                             color: Colors.orange,
                             fontSize: 16),
                         // Add a gesture recognizer or onPressed callback for handling the tap
                       ),

                     ],
                   ),
                 ),
               ),
               SizedBox(height: height * 0.02,),














             ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaW extends StatelessWidget {
  const SocialMediaW({
    super.key,
     this.height,
     this.icon,
    this.title,
  });

  final double? height;
   final String? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.sizeOf(context).height * 0.07,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: Image.asset(icon ??'assets/images/apple.png',color: Colors.white,
               fit: BoxFit.fill,

            ),
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.08,),


          Text(title ??'Continue with apple',style: TextStyles.boardingHeading.copyWith(
            fontSize: 16,
            color: Colors.white
          ),)

        ],
      ),
    );
  }
}

