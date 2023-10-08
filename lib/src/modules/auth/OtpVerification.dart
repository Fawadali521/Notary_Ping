
import 'package:flutter/material.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';

import '../../../styles.dart';
import 'package:pinput/pinput.dart';

import '../../utility/common_button.dart';



//Asimkhan1122


class OtpVerification extends StatelessWidget {
    OtpVerification({Key? key}) : super(key: key);
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyles.heading1,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: Palette.primaryColor),
    ),
  );
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
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Text('OTP Verification',style: TextStyles.heading1,),
              ),
              const Text(
                'We just sent you SMS with 4 digit code Looks like '
                    'you will be soon logged in',
                textAlign: TextAlign.start,

                style: TextStyles.bodyText,),

               const Padding(
                 padding: EdgeInsets.only(top: 20, bottom: 20),
                 child: Center(child: Text('Enter the code in the box below ',style: TextStyles.bodyText,)),
               ),
           Padding(
             padding: const EdgeInsets.only(
               top: 20,
               bottom: 10
             ),
             child: Center(
              child: Pinput(
                length: 6,

                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color:Palette.primaryColor),
                  ),
                ),
                submittedPinTheme: PinTheme(),
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
          ),
           ),
               Padding(
                 padding: const EdgeInsets.only(
                   top: 20,
                   bottom: 20,
                   left: 10,
                   right: 10
                 ),
                 child: SubmitButton(onTap: (){},
                     title: 'Verify'),
               ),

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
    );
  }
}
