import 'package:flutter/material.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';

import '../../../styles.dart';
import '../../utility/common_button.dart';
import '../../utility/text_field.dart';

//Asimkhan1122
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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

              const Padding(
                padding: EdgeInsets.only(

                  top: 40,
                  bottom: 20,
                  left: 10

                ),
                child: Text('Forgot Password?',style: TextStyles.heading1,),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 20,
                  top: 20
                ),
                child: Text(
                  'Donot worry it can be '
                    'happen enter your email address assocaited with this account ',
                  textAlign: TextAlign.start,

                  style: TextStyles.bodyText,),
              ),

               Padding(
                 padding: const EdgeInsets.only(
                   top: 20,
                   bottom: 20,
                   left: 10
                 ),
                 child: Text('Email/phone',style: TextStyles.bodyText,),
               ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20
                ),
                child: const TextFieldWidget(
                  hintText: 'Enter password',
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
               SubmitButton(
                   onTap: (){},
                   title: 'SEND'),


               SizedBox(height: height * 0.02,),














            ],
          ),
        ),
      ),
    );  }
}
