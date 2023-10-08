

import 'package:flutter/material.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';

import '../../../styles.dart';
import '../../utility/common_button.dart';
import '../../utility/text_field.dart';

//Asimkhan1122 '
class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return   Scaffold(


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
                  child: Icon(Icons.arrow_back, size: 24,color: Colors.black,)),

              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 20,
                ),
                child: Text('Reset Password',style: TextStyles.heading1,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: const Text(
                  'Your password must be different from the previously used password',
                  textAlign: TextAlign.start,

                  style: TextStyles.bodyText,),
              ),

               Padding(
                 padding: const EdgeInsets.only(
                   top: 15
                 ),
                 child: Text('New Password',style: TextStyles.bodyText,),
               ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 10
                ),
                child: const TextFieldWidget(
                  hintText: 'Enter password',
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(
                   top: 20
                 ),
                 child: Text('Confirm Password',style: TextStyles.bodyText,),
               ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 20
                ),
                child: const TextFieldWidget(
                  hintText: 'Confirm password',
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(
                   top: 20,
                   bottom: 40
                 ),
                 child: SubmitButton(onTap: (){},
                     title: 'Continue'),
               ),
               Center(
                child: Image.asset('assets/logo/full-logo.png',
                  height: height * 0.06,
                  width: width * 0.7,

                ),
              ),



              SizedBox(height: height * 0.02,),














            ],
          ),
        ),
      ),
    );  }
}
