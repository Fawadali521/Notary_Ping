import 'package:flutter/material.dart';
import 'package:notary_ping/index.dart';

const String fontFamilyInter = "Inter";

class TextStyles {
  static const headlineLarge = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    fontFamily: fontFamilyInter,
    color: Colors.black,
  );
  static const headlineMedium = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24,
    fontFamily: fontFamilyInter,
    color: Colors.black,
  );
  static const headlineSmall = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    fontFamily: fontFamilyInter,
    color: Colors.black,
  );

  static const titleLarge = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    fontFamily: fontFamilyInter,
    color: Colors.black,
  );
  static const titleMedium = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    fontFamily: fontFamilyInter,
    color: Colors.black,
  );
  static const titleSmall = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    fontFamily: fontFamilyInter,
    color: Colors.black,
  );
  static const bodyLarge = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    fontFamily: fontFamilyInter,
    color: Colors.black,
  );
  static const bodyMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontFamily: fontFamilyInter,
    color: Palette.greyTextColor,
  );
  static const bodySmall = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    fontFamily: fontFamilyInter,
    color: Palette.greyTextColor,
  );

  /// previous
  static const bodyText = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.black,
      fontFamily: 'Montserrat-Light');
  static const chatCount = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Colors.white,
      fontFamily: 'Montserrat-Light');
  static const requestText = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.white,
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
  TextStyle profileTileText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.black.withOpacity(0.7),
      fontFamily: 'Montserrat-Regular');
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
      fontWeight: FontWeight.w900,
      fontSize: 16,
      color: Colors.white,
      fontFamily: 'Montserrat-Bold');
  TextStyle profileBold = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
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
  TextStyle newChat = const TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 12,
      color: Colors.white,
      fontFamily: 'Montserrat-Medium');
  static const chatPersonName = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Colors.white,
      fontFamily: 'Montserrat-SemiBold');

  static const chatOnlineTyping = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.white,
      fontFamily: 'Montserrat-Light');
}

class BorderStyles {
  static final normal = BorderRadius.circular(8);
  static final medium = BorderRadius.circular(12);
  static const textFieldBorderRadius = BorderRadius.all(Radius.circular(10));
  static const buttonRadius = BorderRadius.all(Radius.circular(15));
}

class Palette {
  static const Color bgColor = Color(0xFFF9F9F9);
  static const Color primaryColor = Color(0xFF0DB1EF);
  static const Color bgTextFeildColor = Color(0xFFF9F9F9);
  static const Color secondaryColor = blue2;
  static const Color textFieldFill = Color(0xFFf5f7f9);
  static const Color blue1 = Color(0xFF0DB1EF);
  static const Color blue2 = Color(0xFF244e9d);
  static const Color blue3 = Color(0xFF00aeef);
  static const Color bgOnboardingColor = Color(0xFFF9FDFF);
  static const Color greyTextColor = Color(0xFF767676);
  static const Color lightBlue = Color(0xFFCFEFFC);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color orangColor = Color(0xFFF78100);
  static const Color lightBlueColor = Color(0xFFE0F3FE);
}
