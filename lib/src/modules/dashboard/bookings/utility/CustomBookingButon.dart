// ignore_for_file: file_names

import '../../../../../index.dart';

class CustomBookingButon extends StatelessWidget {
  final String title; // The title of the button
  final String icon; // The icon path for the button
  final bool isSlected; // Indicates if the button is selected or not
  final VoidCallback onTap; // Callback function when the button is tapped

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
        padding: const EdgeInsets.only(left: 4, right: 14, top: 7, bottom: 7),
        decoration: BoxDecoration(
          color: isSlected ? Palette.primaryColor : Palette.whiteColor, // Set the background color based on the selected state
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 15.sp,
              backgroundColor:
                  isSlected ? Palette.whiteColor : Palette.orangColor, // Set the background color of the circle avatar based on the selected state
              child: Image.asset(
                icon,
                height: 14.sp,
                color: isSlected ? Palette.primaryColor : Palette.whiteColor, // Set the color of the icon based on the selected state
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: TextStyles.titleMedium.copyWith(
                color: isSlected ? Palette.whiteColor : Palette.blackColor, // Set the text color based on the selected state
              ),
            ),
          ],
        ),
      ),
    );
  }
}
