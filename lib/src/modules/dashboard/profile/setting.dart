import 'package:flutter/material.dart';

import '../../../../styles.dart';
import '../../../utility/TextFieldPassword.dart';



class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const  IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Palette.primaryColor.withOpacity(0.7),

        title: Text('App Setting', style: TextStyles().appBarTitleWhite,),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20
        ),
        children: const [
          Padding(
            padding: EdgeInsets.only(
              bottom: 20,

            ),
            child: Text('Change Password',style: TextStyles.heading1,),
          ),

          Padding(
            padding: EdgeInsets.only(
              bottom: 20
            ),
            child: PasswordField(
              hint: 'Enter new password',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: 20
            ),
            child: PasswordField(
              hint: 'Confirm new password',
            ),
          ),


        ],
      ),
    );
  }
}
