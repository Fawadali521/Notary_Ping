import 'package:flutter/material.dart';

import '../../../styles.dart';
import '../../utility/common_button.dart';
import '../../utility/text_field.dart';

//Asimkhan1122
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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

              Text('Register',style: TextStyles.boardingHeading,),
              Text(
                'Donot worry it can be '
                  'happen enter your email address assocaited with this account ',
                textAlign: TextAlign.start,

                style: TextStyles.bodyBlack,),

              SizedBox(height: height * 0.06,),
              Text('Email/phone',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.06,),

              const TextFieldWidget(
                hintText: 'Enter password',
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              SizedBox(height: height * 0.08,),
               ElevatedButtonWidget(buttonText: 'SEND', buttonColor: Colors.orange,),
              SizedBox(height: height * 0.02,),


               SizedBox(height: height * 0.02,),














            ],
          ),
        ),
      ),
    );  }
}
