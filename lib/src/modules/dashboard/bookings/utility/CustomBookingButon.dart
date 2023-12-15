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
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: isSlected ? Palette.primaryColor : Palette.whiteColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16.sp,
              backgroundColor:
                  isSlected ? Palette.whiteColor : Palette.orangColor,
              child: Image.asset(
                icon,
                height: 20.sp,
                color: isSlected ? Palette.primaryColor : Palette.whiteColor,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyles.titleMedium.copyWith(
                color: isSlected ? Palette.whiteColor : Palette.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
