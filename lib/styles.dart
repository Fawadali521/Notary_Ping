import 'package:flutter/material.dart';

//Asimkhan
class TextStyles {
  static const bodyText = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.black,
      fontFamily: 'Montserrat-Light');
  static const normalHeading = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Colors.black,
      fontFamily: 'Montserrat-SemiBold');
  static const mediumBold = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Colors.black,
      fontFamily: 'Montserrat-SemiBold');
  static const languageTitle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Colors.black,
      fontFamily: 'Montserrat-Regular');
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
      fontSize: 14,
      color: Colors.white,
      fontFamily: 'Montserrat-Bold');
  static const bottomBarText = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: Colors.grey,
      fontFamily: 'Montserrat-Regular');
  TextStyle   profileTileText = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.black.withOpacity(0.7),
      fontFamily: 'Montserrat-Bold');
  static const buttonTextBlack = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Colors.black,
      fontFamily: 'Montserrat-Bold');
  static const authTitleHeadingBlack = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Colors.black,
      fontFamily: 'Montserrat-Medium');
  static const textField = TextStyle(
      fontWeight: FontWeight.w100,
      fontSize: 13,
      color: Colors.black,
      fontFamily: 'Montserrat-Medium');
  TextStyle textFieldHint = TextStyle(
      fontWeight: FontWeight.w100,
      fontSize: 13,
      color: Colors.black.withOpacity(0.5),
      fontFamily: 'Montserrat-Medium');
  TextStyle privacyBLack = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Colors.black.withOpacity(0.8),
      fontFamily: 'Montserrat-Medium');
  TextStyle profileWhite = const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: Colors.white,
      fontFamily: 'Montserrat-Medium');
  TextStyle profileBold = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.white,
      fontFamily: 'Montserrat-Bold');
  TextStyle profileLocation = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.white,
      fontFamily: 'Montserrat-Medium');
  TextStyle privacySecondaryColor = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Palette.secondaryColor.withOpacity(0.9),
      fontFamily: 'Montserrat-Medium');
  TextStyle appBarTitleBlack = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Colors.black.withOpacity(0.9),
      fontFamily: 'Montserrat-Medium');
  TextStyle appBarTitleWhite = const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: Colors.white,
      fontFamily: 'Montserrat-Medium');
}

class BorderStyles {
  static const norm = BorderRadius.all(Radius.circular(7));
  static const textFieldBorderRadius = BorderRadius.all(Radius.circular(10));
  static const buttonRadius = BorderRadius.all(Radius.circular(16));
}

class Palette {
  static const Color primaryColor = blue3;
  static const Color secondaryColor = blue2;
  static const Color textFieldFill = Color(0xFFf5f7f9);

  static const Color blue1 = Color(0xFF0DB1EF);
  static const Color blue2 = Color(0xFF244e9d);
  static const Color blue3 = Color(0xFF00aeef);
}
