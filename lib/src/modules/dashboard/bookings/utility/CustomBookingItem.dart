// ignore_for_file: file_names

import '../../../../../index.dart';

class CustomBookingItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String date;
  final String time;
  final bool isHistory;
  final VoidCallback onTap;

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
        color: Palette.whiteColor,
        borderRadius: BorderStyles.normal,
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
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(imgUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyles.titleMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Text(
                            date,
                            style: TextStyles.bodySmall,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyles.bodySmall,
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
                    color: Palette.bgTextFeildColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Signature for property documents".tr,
                    style: TextStyles.bodyLarge.copyWith(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: Palette.lightBlueColor.withOpacity(0.7),
                borderRadius: BorderStyles.thin,
              ),
              child: Text(
                isHistory ? "View".tr : "Tracking".tr,
                style: TextStyles.bodyLarge.copyWith(
                  color: Palette.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
