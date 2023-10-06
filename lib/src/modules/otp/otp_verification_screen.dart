
import 'package:flutter/material.dart';

import '../../../styles.dart';
import 'package:pinput/pinput.dart';

import '../../utility/common_button.dart';



//Asimkhan1122


class OtpVerificationScreen extends StatelessWidget {
    OtpVerificationScreen({Key? key}) : super(key: key);
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: Colors.orange),
    ),
  );
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

              Text('OTP Verification',style: TextStyles.boardingHeading,),
              const Text(
                'We just sent you SMS with 4 digit code Looks like '
                    'you will be soon logged in',
                textAlign: TextAlign.start,

                style: TextStyles.bodyBlack,),

              SizedBox(height: height * 0.06,),
              Center(child: const Text('Enter the code in the box below ',style: TextStyles.bodyBlack,)),
              SizedBox(height: height * 0.04,),
          Center(
            child: Pinput(
              length: 4,

              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
              ),              submittedPinTheme: PinTheme(),
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
          ),

               SizedBox(height: height * 0.08,),
              const ElevatedButtonWidget(buttonText: 'Verify', buttonColor: Colors.orange,),
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
