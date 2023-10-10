
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles.dart';
class SubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color color;
  const SubmitButton(
      {super.key,
        required this.onTap,
        required this.title,
        this.color = Palette.secondaryColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      elevation: 1,
      height: 45,
      color: color,
      shape:   const RoundedRectangleBorder(
        borderRadius: BorderStyles.buttonRadius,
      ),
      child: Center(
        child: Text(
          title,
         style: TextStyles.buttonText.copyWith(
           fontWeight: FontWeight.w600
         ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
