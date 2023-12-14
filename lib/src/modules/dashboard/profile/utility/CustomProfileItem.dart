// ignore_for_file: file_names

import '../../../../../index.dart';

class CustomProfileItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const CustomProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Palette.whiteColor,
          borderRadius: BorderStyles.normal,
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 20,
              width: 20,
              color: Palette.greyTextColor,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 12.w),
            Text(
              title.tr,
              style: TextStyles.bodyLarge,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Palette.greyTextColor,
            )
          ],
        ),
      ),
    );
  }
}
