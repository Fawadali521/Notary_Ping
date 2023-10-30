import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../styles.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  String selectedLanguage = 'English';

  void selectLanguage(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Palette.secondaryColor,
        title: Text(
          'Languages',
          style: TextStyles().appBarTitleWhite,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
            top: 20, left: 20, right: 20
        ),
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
      padding: const EdgeInsets.only(
        bottom: 20
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: 10,

        ),
        height: 50,
         decoration: BoxDecoration(
             borderRadius: BorderStyles.norm,
             color: Palette.textFieldFill
        ),
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
