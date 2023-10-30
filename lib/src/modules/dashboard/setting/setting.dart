
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';

import '../../../../styles.dart';
import '../../../utility/TextFieldPassword.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool notificationSwitchValue = true;
  bool availableSwitchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Palette.secondaryColor,
        title: Text(
          'App Setting',
          style: TextStyles().appBarTitleWhite,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderStyles.norm,
                  color: Palette.textFieldFill),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Notification',
                      style: TextStyles.mediumBold,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                        activeColor: Palette.primaryColor,
                        value: notificationSwitchValue,
                        onChanged: (newValue) {
                          setState(() {
                            notificationSwitchValue = newValue;
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderStyles.norm,
                  color: Palette.textFieldFill),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Availability',
                      style: TextStyles.mediumBold,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                        activeColor: Palette.primaryColor,
                        value: availableSwitchValue,
                        onChanged: (newValue) {
                          setState(() {
                            availableSwitchValue = newValue;
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 20,
            ),
            child: Text(
              'Change Password',
              style: TextStyles.normalHeading,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: PasswordField(
              hint: 'Enter Old password',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: PasswordField(
              hint: 'Enter new password',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SubmitButton(onTap: () {}, title: 'Update Password'),
          )
        ],
      ),
    );
  }
}
