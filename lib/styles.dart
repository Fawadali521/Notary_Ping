import 'package:flutter/material.dart';

//Asimkhan
class TextStyles {
  static const bodyText = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.black,
      fontFamily: 'Montserrat-Light');
  static const normalHeading = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Colors.black,
      fontFamily: 'Montserrat-SemiBold');
  static const hintText = TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: 14,
      color: Colors.black,
      fontFamily: 'Montserrat-Light');
  static const heading1 = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.black,
      fontFamily: 'Montserrat-Regular');
  static const buttonText = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
      fontFamily: 'Montserrat-Bold');
}

class BorderStyles {
  static const norm = BorderRadius.all(Radius.circular(7));
  static const textFieldBorderRadius = BorderRadius.all(Radius.circular(10));
  static const buttonRadius = BorderRadius.all(Radius.circular(16));
}

class Palette {
  static const Color primaryColor = blue1;
  static const Color secondaryColor = blue3;
  static const Color textFieldFill = Color(0xFFf5f7f9);

  static const Color blue1 = Color(0xFF0DB1EF);
  static const Color blue2 = Color(0xFF244e9d);
  static const Color blue3 = Color(0xFF00aeef);
}
