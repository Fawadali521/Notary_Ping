import 'package:flutter/material.dart';
//Asimkhan
class TextStyles {
  static const bodyBlack = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.black,
    fontFamily: 'Montserrat-Light'
  );
  static const hintText = TextStyle(
    fontWeight: FontWeight.w200,
    fontSize: 12,
    color: Colors.black,
    fontFamily: 'Montserrat-Light'
  );
  static const boardingHeading = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.black,
    fontFamily: 'Montserrat-Bold'
  );
}

class BorderStyles {
  static const norm = BorderRadius.all(Radius.circular(7));
}

class Palette {
  static const Color primaryColor = blue1;
  static const Color secondaryColor = blue3;
  static const Color blue1 = Color(0xFF2d388a);
  static const Color blue2 = Color(0xFF244e9d);
  static const Color blue3 = Color(0xFF00aeef);
}
