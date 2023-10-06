

import 'package:flutter/material.dart';

import '../../../styles.dart';
import '../../utility/common_button.dart';
import '../../utility/text_field.dart';
import '../login/login_screen.dart';


//Asimkhan1122
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
              Text('Register',style: TextStyles.boardingHeading,),
              Text('Create Your Account Now',style: TextStyles.bodyBlack,),


              SizedBox(height: height * 0.04,),
              Text('First Name  ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.02,),
             const TextFieldWidget(),
              SizedBox(height: height * 0.02,),

              Text('Registration Date  ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.02,),
              const TextFieldWidget(
                suffixIcon: Icon(Icons.calendar_month),
              ),
              SizedBox(height: height * 0.02,),
              Text('City ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.01,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),
              SizedBox(height: height * 0.02,),
              Text('State ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.01,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),
              SizedBox(height: height * 0.02,),
              Text('Email ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.01,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),
              SizedBox(height: height * 0.02,),
              const Text('Password ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.01,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),
               SizedBox(height: height * 0.02,),
              Row(
                 children: [
                   Checkbox(
                       activeColor: Colors.orange,
                       value: true, onChanged: (v){}),
                  Text('Remember me',style: TextStyles.boardingHeading.copyWith(fontSize: 16),),
                  Spacer(),
                  Text('Forgot Password',style: TextStyles.boardingHeading.copyWith(fontSize: 16),),

                ],
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.orange,

                      value: true, onChanged: (v){}),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'I agree with  ',
                          style: TextStyles.boardingHeading.copyWith(fontSize: 16),
                        ),
                        TextSpan(
                          text: 'Term and Condition',
                          style: TextStyles.boardingHeading.copyWith(
                              color: Colors.orange,
                              fontSize: 16),
                          // Add a gesture recognizer or onPressed callback for handling the tap
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02,),
              ElevatedButtonWidget(buttonText: 'Register', buttonColor: Colors.orange,),
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
                        "OR Login With",
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
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Have an account  ',
                        style: TextStyles.boardingHeading.copyWith(fontSize: 16),
                      ),
                      TextSpan(
                        text: 'Sign In',
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
