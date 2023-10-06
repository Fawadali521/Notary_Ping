

import 'package:flutter/material.dart';

import '../../../styles.dart';
import '../../utility/common_button.dart';
import '../../utility/text_field.dart';

//Asimkhan1122
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

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
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, size: 24,color: Colors.white,)),
              SizedBox(height: height * 0.08,),

              Text('Reset Password',style: TextStyles.boardingHeading,),
              const Text(
                'Your password must be different from the previously used password',
                textAlign: TextAlign.start,

                style: TextStyles.bodyBlack,),

              SizedBox(height: height * 0.06,),
              Text('New Password',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.02,),

              const TextFieldWidget(
                hintText: 'Enter password',
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              SizedBox(height: height * 0.06,),
              Text('Confirm Password',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.02,),

              const TextFieldWidget(
                hintText: 'Enter password',
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              SizedBox(height: height * 0.08,),
              const ElevatedButtonWidget(buttonText: 'Continue', buttonColor: Colors.orange,),
              SizedBox(height: height * 0.06,),
              Center(
                child: Image.asset('assets/logo/full-logo.png',
                  height: height * 0.06,
                  width: width * 0.6,

                ),
              ),



              SizedBox(height: height * 0.02,),














            ],
          ),
        ),
      ),
    );  }
}
