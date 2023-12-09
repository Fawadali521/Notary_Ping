// ignore_for_file: file_names

import '../../index.dart';

class SocialButton extends StatelessWidget {
  final String status;
  final VoidCallback onTap;
  const SocialButton({super.key, this.status = "GO", required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      color: socialColor(status),
      shape: RoundedRectangleBorder(
        borderRadius: BorderStyles.normal,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  socialTitle(status).tr,
                  style: TextStyles.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Image.asset(
              socialIcon(status),
              fit: BoxFit.contain,
              height: 24,
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
    return Palette.bgTextFeildColor;
  }

  String socialIcon(String status) {
    if (status == "GO") {
      return "$images/googlee.png";
    }
    if (status == "AP") {
      return "$images/apple.png";
    } else {
      return "assets/social/apple.png";
    }
  }
}
