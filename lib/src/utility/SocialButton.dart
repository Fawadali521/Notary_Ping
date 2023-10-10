import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notary_ping/styles.dart';

class SocialButton extends StatelessWidget {
  final String status;
  final VoidCallback onTap;
  const SocialButton({super.key, this.status = "GO", required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: MaterialButton(
        elevation: 0,
        onPressed: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        color: socialColor(status),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderStyles.buttonRadius,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  socialTitle(status),
                  style: TextStyles.buttonText,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Image.asset(
              socialIcon(status),
              fit: BoxFit.contain,
              height: 24,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  String socialTitle(String status) {
    if (status == "GO") {
      return "Continue With Google";
    }
    if (status == "FB") {
      return "Continue With Facebook";
    } else {
      return "Continue With Apple";
    }
  }

  Color socialColor(String status) {
    if (status == "GO") {
      return Colors.red;
    }
    if (status == "FB") {
      return Colors.blue;
    } else {
      return Colors.black;
    }
  }

  String socialIcon(String status) {
    if (status == "GO") {
      return "assets/images/google.png";
    }
    if (status == "AP") {
      return "assets/images/apple.png";
    } else {
      return "assets/social/apple.png";
    }
  }
}
