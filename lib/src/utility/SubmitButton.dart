
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
        this.color = Palette.primaryColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      elevation: 1,
      height: 50,
      color: color,
      shape:   RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
         style: TextStyles.buttonText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
