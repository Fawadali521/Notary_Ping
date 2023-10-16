
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ));
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Palette.secondaryColor,
        title: Text(
          'Languages',
          style: TextStyles().appBarTitleWhite,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
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

    return GestureDetector(
      onTap: () {
        selectLanguage(language);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15 , right: 15),
        child: Container(
          height: 50,
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderStyles.norm,
              color: Palette.textFieldFill),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                language,
                style: TextStyles.languageTitle.copyWith(
                    // color: isSelected ? Palette.primaryColor : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,

                ),
                // style: TextStyle(
                //   fontSize: isSelected ? 16 : 14, // Adjust font size as needed
                //   fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                //   color: isSelected ? Palette.primaryColor : Colors.black,
                // ),
              ),
              if (isSelected)
                Image.asset(
                  'assets/icon/tick.png',
                  height: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
