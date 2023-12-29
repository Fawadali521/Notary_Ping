// ignore_for_file: file_names

import '../../../../../index.dart';

class CustomBookingItem extends StatelessWidget {
  final String imgUrl; // The URL of the image for the booking item
  final String name; // The name associated with the booking item
  final String date; // The date of the booking
  final String time; // The time of the booking
  final bool isHistory; // Indicates if the booking is a historical booking
  final VoidCallback onTap; // Callback function when the booking item is tapped

  const CustomBookingItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.date,
    required this.time,
    this.isHistory = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Palette.whiteColor, // Background color of the booking item container
        borderRadius: BorderStyles.normal, // Border radius of the booking item container
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80, // Height of the booking item image container
                      width: 80, // Width of the booking item image container
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Shape of the booking item image container
                        image: DecorationImage(
                          image: AssetImage(imgUrl), // Image to be displayed in the booking item image container
                          fit: BoxFit.cover, // How the image should be fitted within the container
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name, // Name of the booking item
                          style: TextStyles.titleMedium, // Style for the name text
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Text(
                            date, // Date of the booking
                            style: TextStyles.bodySmall, // Style for the date text
                          ),
                        ),
                        Text(
                          time, // Time of the booking
                          style: TextStyles.bodySmall, // Style for the time text
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Palette.bgTextFeildColor, // Background color of the additional information container
                    borderRadius: BorderRadius.circular(20), // Border radius of the additional information container
                  ),
                  child: Text(
                    "Signature for property documents".tr, // Additional information text
                    style: TextStyles.bodyLarge.copyWith(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: onTap, // Callback function when the booking item is tapped
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: Palette.lightBlueColor.withOpacity(0.7), // Background color of the action button container
                borderRadius: BorderStyles.thin, // Border radius of the action button container
              ),
              child: Text(
                isHistory ? "View".tr : "Tracking".tr, // Text to be displayed on the action button
                style: TextStyles.bodyLarge.copyWith(
                  color: Palette.primaryColor, // Color of the text on the action button
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
