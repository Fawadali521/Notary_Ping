// ignore_for_file: file_names

import 'package:notary_ping/src/modules/dashboard/bookings/utility/CustomBookingButon.dart';
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
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
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
        ],
      ),
    );
  }
}
