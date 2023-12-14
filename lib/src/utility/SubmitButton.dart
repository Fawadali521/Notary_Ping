// ignore_for_file: file_names

import '../../index.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color? backGroundColor;
  final Color? titleColor;
  final bool? isLoading;
  const SubmitButton({
    super.key,
    required this.onTap,
    required this.title,
    this.backGroundColor,
    this.titleColor,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isLoading == true ? null : onTap,
      elevation: 0,
      color: backGroundColor ?? Palette.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderStyles.normal,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Center(
          child: Text(
            title.tr,
            style: TextStyles.titleSmall.copyWith(
              color: titleColor ?? Palette.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
