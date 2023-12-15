// ignore_for_file: file_names

import 'package:notary_ping/src/modules/dashboard/bookings/utility/CustomBookingButon.dart';
import 'package:notary_ping/src/modules/dashboard/profile/utility/CustomProfileItem.dart';
import 'package:notary_ping/src/states/profile/ProfileController.dart';

import '../../../../index.dart';

class NotaryProfile extends StatelessWidget {
  NotaryProfile({super.key});
  final ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      appBar: CustomAppBar(
        title: 'Profile'.tr,
        isBack: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 70,
              width: 70,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          user,
                          fit: BoxFit.cover,
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 4,
                      child: CircleAvatar(
                        backgroundColor: Palette.whiteColor,
                        radius: 8,
                        child: CircleAvatar(
                          backgroundColor: Palette.greenColor,
                          radius: 6,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "Mansurul Hoque".tr,
            style: TextStyles.headlineSmall,
            textAlign: TextAlign.center,
          ),
          Text(
            "Lawyer".tr,
            style: TextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                locationProfileIcon,
                height: 16,
                width: 16,
                fit: BoxFit.contain,
                color: Palette.greyTextColor,
              ),
              const SizedBox(width: 5),
              Text(
                "Lafayette, California 90001 ".tr,
                style: TextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomBookingButon(
                      onTap: () {
                        // currentIndex = 0;
                        // pageController?.jumpToPage(0);
                        // setState(() {});
                      },
                      title: 'Book appointment'.tr,
                      icon: bookingsIcon,
                      isSlected: true //currentIndex == 0 ? true : false,
                      ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  flex: 2,
                  child: CustomBookingButon(
                      onTap: () {
                        // currentIndex = 1;
                        // pageController?.jumpToPage(1);
                        // setState(() {});
                      },
                      title: 'Message'.tr,
                      icon: messageIcon,
                      isSlected: true //currentIndex == 1 ? true : false,
                      ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderStyles.normal,
              color: Palette.whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "About".tr,
                  style: TextStyles.titleLarge,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, to Sed ut perspiciatis unde omnis iste natus "
                      .tr,
                  style: TextStyles.bodySmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderStyles.normal,
                      color: Palette.whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "July 13.2023".tr,
                          style: TextStyles.titleMedium,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Commission expiration date".tr,
                          style: TextStyles.bodySmall.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderStyles.normal,
                      color: Palette.whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "05+".tr,
                          style: TextStyles.titleMedium,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Years experience".tr,
                          style: TextStyles.bodySmall.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomProfileItem(
            icon: reportNotaryPIcon,
            title: 'Report this Notary'.tr,
            iconColor: Palette.primaryColor,
            backgroundColor: Palette.rportNotryProfileColor,
            onTap: () {},
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(
                  // flex: 3,
                  child: CustomBookingButon(
                      onTap: () {
                        // currentIndex = 0;
                        // pageController?.jumpToPage(0);
                        // setState(() {});
                      },
                      title: 'Services'.tr,
                      icon: supportIcon,
                      isSlected: true //currentIndex == 0 ? true : false,
                      ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  // flex: 2,
                  child: CustomBookingButon(
                      onTap: () {
                        // currentIndex = 1;
                        // pageController?.jumpToPage(1);
                        // setState(() {});
                      },
                      title: 'Reviews'.tr,
                      icon: reviewsIcon,
                      isSlected: false //currentIndex == 1 ? true : false,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          // Wrap(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          //       decoration: BoxDecoration(
          //         color: Palette.whiteColor,
          //         borderRadius: BorderRadius.circular(30),
          //       ),
          //       child: Row(
          //         children: [
          //           Image.asset(
          //             supportIcon,
          //             height: 20,
          //             width: 20,
          //             color: Palette.greyTextColor,
          //             fit: BoxFit.contain,
          //           ),
          //           SizedBox(width: 8.w),
          //           const Text(
          //             "Translation certification",
          //             style: TextStyles.bodyMedium,
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          //       decoration: BoxDecoration(
          //         color: Palette.whiteColor,
          //         borderRadius: BorderRadius.circular(30),
          //       ),
          //       child: Row(
          //         children: [
          //           Image.asset(
          //             supportIcon,
          //             height: 20,
          //             width: 20,
          //             color: Palette.greyTextColor,
          //             fit: BoxFit.contain,
          //           ),
          //           SizedBox(width: 8.w),
          //           const Text(
          //             "Translation certification",
          //             style: TextStyles.bodyMedium,
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          //       decoration: BoxDecoration(
          //         color: Palette.whiteColor,
          //         borderRadius: BorderRadius.circular(30),
          //       ),
          //       child: Row(
          //         children: [
          //           Image.asset(
          //             supportIcon,
          //             height: 20,
          //             width: 20,
          //             color: Palette.greyTextColor,
          //             fit: BoxFit.contain,
          //           ),
          //           SizedBox(width: 8.w),
          //           const Text(
          //             "Translation certification",
          //             style: TextStyles.bodyMedium,
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          //       decoration: BoxDecoration(
          //         color: Palette.whiteColor,
          //         borderRadius: BorderRadius.circular(30),
          //       ),
          //       child: Row(
          //         children: [
          //           Image.asset(
          //             supportIcon,
          //             height: 20,
          //             width: 20,
          //             color: Palette.greyTextColor,
          //             fit: BoxFit.contain,
          //           ),
          //           SizedBox(width: 8.w),
          //           const Text(
          //             "Translation cen",
          //             style: TextStyles.bodyMedium,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        
        
        ],
      ),
    );
  }
}
