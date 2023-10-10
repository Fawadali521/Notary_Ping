import 'package:flutter/material.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';
import 'package:notary_ping/src/utility/TextFieldEmail.dart';

import '../../../styles.dart';

//Asimkhan1122
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        children: [
          SizedBox(
            height: height * 0.08,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 20, left: 10),
            child: Text(
              'Forgot Password?',
              style: TextStyles.authTitleHeadingBlack,
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
                hint: 'Enter you email ',
              )),
          SubmitButton(onTap: () {}, title: 'SEND'),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    );
  }
}
