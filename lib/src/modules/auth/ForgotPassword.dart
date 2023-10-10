import 'package:flutter/material.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';
import 'package:notary_ping/src/utility/TextFieldEmail.dart';

import '../../../styles.dart';
import '../../utility/TextField.dart';

//Asimkhan1122
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 20, left: 10),
                child: Text(
                  'Forgot Password?',
                  style: TextStyles.heading1,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, bottom: 20, top: 20),
                child: Text(
                  'Donot worry it can be '
                  'happen enter your email address assocaited with this account ',
                  textAlign: TextAlign.start,
                  style: TextStyles.bodyText,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 10),
                child: Text(
                  'Email',
                  style: TextStyles.bodyText,
                ),
              ),
                Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextFieldEmail(
                  initialText: 'Enter you email ',
                  prefixIcon: Padding(
                    padding:   EdgeInsets.all(12.0),
                    child: Image.asset('assets/images/mail.png',
                      height: 10,
                      width: 10,
                      color: Palette.primaryColor,
                    ),
                  ),
                )
              ),
              SubmitButton(onTap: () {}, title: 'SEND'),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
