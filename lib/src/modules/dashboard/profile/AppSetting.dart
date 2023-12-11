// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

import '../../../../index.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({Key? key}) : super(key: key);

  @override
  State<AppSetting> createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  String selectedLanguage = 'English';

  void selectLanguage(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: CustomAppBar(
        color: Palette.whiteColor,
        title: 'App setting'.tr,
        isBack: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        children: [
          buildLanguageRow('English'),
          buildLanguageRow('Spanish'),
          buildLanguageRow('French'),
          // Add more languages as needed
        ],
      ),
    );
  }

  Widget buildLanguageRow(String language) {
    final isSelected = selectedLanguage == language;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderStyles.normal, color: Palette.textFieldFill),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: Palette.primaryColor,
                value: isSelected,
                onChanged: (value) {
                  selectLanguage(language);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
