import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';

import '../../../styles.dart';
import '../../utility/TextField.dart';
import '../../utility/TextFieldPassword.dart';

//Asimkhan1122 '
class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ));

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);

          },
          child: Padding(
            padding: const EdgeInsets.
            only(left: 10),
            child: Container(
              height: 50,
              width: 50,
              decoration:   BoxDecoration(
                color: Palette.textFieldFill,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],

              ),
              child: const Center(child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.arrow_back_ios),
              ),),
            ),
          ),
        ),
        title: Text('Reset Password' ,style: TextStyles().appBarTitle,),

      ),

      body: ListView(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),

        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo/full-logo.png",
                  fit: BoxFit.contain,
                  width: width - 40,
                  height: height * 0.08,
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(

              bottom: 20,
            ),
            child: Text(
              'Reset Password',
              style: TextStyles.heading1,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Please enter a new password and confirm it below to reset your password.',
              textAlign: TextAlign.center,
              style: TextStyles.bodyText,
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: const PasswordField(
              hint: 'Enter new password',
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: const PasswordField(
              hint: 'Confirm new password',
            ),
          ),
          SubmitButton(onTap: () {}, title: 'Continue'),


        ],
      ),
    );
  }
}
