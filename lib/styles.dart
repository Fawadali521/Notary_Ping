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
}

class BorderStyles {
  static final thin = BorderRadius.circular(4);
  static final normal = BorderRadius.circular(8);
  static final medium = BorderRadius.circular(12);
  static final searchTextField = BorderRadius.circular(30);
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
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color orangColor = Color(0xFFF78100);
  static const Color lightBlueColor = Color(0xFFE0F3FE);
  static const Color greenColor = Color(0xFF46C45D);
  static const Color reciveChatColor = Color(0xFFF2F7FB);
  static const Color redColor = Color(0xFFEB5757);
  static const Color dotColor = Color(0xFFCFEFFC);
}
