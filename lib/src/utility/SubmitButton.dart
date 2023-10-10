import 'package:flutter/material.dart';

import '../../styles.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color color;
  final bool? isLoading;
  const SubmitButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.color = Palette.primaryColor,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isLoading == true ? null : onTap,
      elevation: 0,
      height: 45,
      color: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderStyles.buttonRadius,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyles.buttonText.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
