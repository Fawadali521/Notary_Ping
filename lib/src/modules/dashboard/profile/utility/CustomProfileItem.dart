// ignore_for_file: file_names

import '../../../../../index.dart';

class CustomProfileItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  const CustomProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 20.w),
        decoration: BoxDecoration(
          color: backgroundColor ?? Palette.whiteColor,
          borderRadius: BorderStyles.normal,
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 20,
              width: 20,
              color: iconColor ?? Palette.greyTextColor,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 12.w),
            Text(
              title.tr,
              style: TextStyles.bodyLarge,
            ),
            const Spacer(),
            Image.asset(
              arrowForwardIosIcon,
              height: 16,
              width: 16,
              color: iconColor ?? Palette.greyTextColor,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
