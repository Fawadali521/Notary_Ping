// ignore_for_file: file_names

import '../../../../../index.dart';

class CustomBookingButon extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSlected;
  final VoidCallback onTap;
  const CustomBookingButon({
    super.key,
    required this.title,
    required this.icon,
    required this.isSlected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35.h,
        padding: EdgeInsets.only(left: 4, right: 15, top: 7, bottom: 7),
        decoration: BoxDecoration(
          color: isSlected ? Palette.primaryColor : Palette.whiteColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 15.sp,
              backgroundColor:
                  isSlected ? Palette.whiteColor : Palette.orangColor,
              child: Image.asset(
                icon,
                height: 14.sp,
                color: isSlected ? Palette.primaryColor : Palette.whiteColor,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 5),
            Text(
              title,
              style: TextStyles.titleLarge.copyWith(
                color: isSlected ? Palette.whiteColor : Palette.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
