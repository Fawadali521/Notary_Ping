// ignore_for_file: file_names

import '../../../../index.dart';

class Bookings extends StatelessWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      appBar: CustomAppBar(
        title: 'Booking'.tr,
        // isBack: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomBookingButon(
                    onTap: () {},
                    title: 'Currents booking'.tr,
                    icon: bookingsIcon,
                    isSlected: true,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomBookingButon(
                    onTap: () {},
                    title: 'History'.tr,
                    icon: bookingsIcon,
                    isSlected: false,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            const CustomBookingItem(
              imgUrl: user,
              name: 'John Doe',
              date: 'June 10,2023',
              time: '10:30 AM',
            ),
            SizedBox(height: 20.h),
            const CustomBookingItem(
              imgUrl: user,
              name: 'John Doe',
              date: 'June 10,2023',
              time: '10:30 AM',
              payemnt: "300",
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  PreferredSize CustomAppBar({required String title, bool? isBack}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        backgroundColor: Palette.bgColor,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyles.headlineLarge,
        ),
        elevation: 0,
        leading: isBack == true
            ? GestureDetector(
                onTap: () => Get.back(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Palette.blackColor.withOpacity(0.7),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

class CustomBookingItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String date;
  final String time;
  final String? payemnt;
  const CustomBookingItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.date,
    required this.time,
    this.payemnt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Palette.whiteColor,
        borderRadius: BorderStyles.normal,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        imgUrl,
                        height: 65.w,
                        width: 70.w,
                        fit: BoxFit.fill,
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
                        Text(
                          date,
                          style: TextStyles.bodySmall,
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
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Palette.bgTextFeildColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Signature for property documents".tr,
                    style: TextStyles.titleMedium,
                  ),
                )
              ],
            ),
          ),
          payemnt == null
              ? Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Palette.lightBlueColor,
                    borderRadius: BorderStyles.normal,
                  ),
                  child: Text(
                    "Tracking".tr,
                    style: TextStyles.titleMedium.copyWith(
                      color: Palette.primaryColor,
                    ),
                  ),
                )
              : Text(
                  "Total:\$$payemnt",
                  style: TextStyles.titleMedium,
                ),
        ],
      ),
    );
  }
}

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
              radius: 13.sp,
              backgroundColor:
                  isSlected ? Palette.whiteColor : Palette.orangColor,
              child: Image.asset(
                bookingsIcon,
                height: 18.sp,
                color: isSlected ? Palette.primaryColor : Palette.whiteColor,
              ),
            ),
            SizedBox(width: 5.w),
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
