// ignore_for_file: file_names,

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:notary_ping/src/constant/time_formate.dart';
import 'package:notary_ping/src/modules/dashboard/bookings/utility/CustomBookingButon.dart';
import 'package:notary_ping/src/modules/dashboard/message/Chat.dart';
import 'package:notary_ping/src/modules/dashboard/notary_profile/BookAppointment.dart';
import 'package:notary_ping/src/modules/dashboard/notary_profile/ReportNotary.dart';
import 'package:notary_ping/src/modules/dashboard/profile/utility/CustomProfileItem.dart';
import 'package:notary_ping/src/states/profile/ProfileController.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../index.dart';

class NotaryProfile extends StatefulWidget {
  const NotaryProfile({super.key});

  @override
  State<NotaryProfile> createState() => _NotaryProfileState();
}

class _NotaryProfileState extends State<NotaryProfile> {
  bool isServices = true;
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
                      onTap: () => Get.to(() => const BookAppointment()),
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
                        Get.to(() => const Chat());
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
            onTap: () => Get.to(() => const ReportNotary()),
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
                      // pageController?.jumpToPage(0);
                      setState(() {
                        isServices = true;
                      });
                    },
                    title: 'Services'.tr,
                    icon: supportIcon,
                    isSlected: isServices ? true : false,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  // flex: 2,
                  child: CustomBookingButon(
                    onTap: () {
                      // pageController?.jumpToPage(1);
                      setState(() {
                        isServices = false;
                      });
                    },
                    title: 'Reviews'.tr,
                    icon: reviewsIcon,
                    isSlected: !isServices ? true : false,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          isServices

              /// Services List
              ? ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    UnconstrainedBox(
                      // alignment: Alignment.centerLeft,
                      child: Wrap(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: Palette.whiteColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  supportIcon,
                                  height: 20,
                                  width: 20,
                                  color: Palette.greyTextColor,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(width: 8.w),
                                const Text(
                                  "Translation",
                                  style: TextStyles.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: Palette.whiteColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  supportIcon,
                                  height: 20,
                                  width: 20,
                                  color: Palette.greyTextColor,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(width: 8.w),
                                const Text(
                                  "Translation certification",
                                  style: TextStyles.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    UnconstrainedBox(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: Palette.whiteColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              supportIcon,
                              height: 20,
                              width: 20,
                              color: Palette.greyTextColor,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 8.w),
                            const Text(
                              "Translation certification",
                              style: TextStyles.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )

              /// Reviews List
              : ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "4.5".tr,
                                style: TextStyles.titleSmall.copyWith(
                                  fontSize: 32,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: RatingBar.builder(
                                  ignoreGestures: true,
                                  initialRating: 4.5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 16,
                                  itemPadding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Palette.yellowColor,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                              ),
                              Text(
                                "367 reviews".tr,
                                style: TextStyles.bodySmall,
                              ),
                            ],
                          ),
                          // SizedBox(width: 25.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              LinearPercentIndicator(
                                clipLinearGradient: true,
                                curve: Curves.easeInCirc,
                                backgroundColor: Palette.whiteColor,
                                width: .35.sw,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 12,
                                leading: SizedBox(
                                  width: 50,
                                  child: Text(
                                    "5 Starts",
                                    style: TextStyles.bodySmall
                                        .copyWith(color: Palette.blackColor),
                                  ),
                                ),
                                trailing: const SizedBox(
                                  width: 30,
                                  child: Text(
                                    "86%",
                                    style: TextStyles.bodySmall,
                                  ),
                                ),
                                percent: 0.86,
                                barRadius: const Radius.circular(30),
                                // linearStrokeCap: LinearStrokeCap.round,
                                progressColor: Palette.primaryColor,
                              ),
                              LinearPercentIndicator(
                                clipLinearGradient: true,
                                curve: Curves.easeInCirc,
                                backgroundColor: Palette.whiteColor,
                                width: .35.sw,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 12,
                                leading: SizedBox(
                                  width: 50,
                                  child: Text(
                                    "4 Starts",
                                    style: TextStyles.bodySmall
                                        .copyWith(color: Palette.blackColor),
                                  ),
                                ),
                                trailing: const SizedBox(
                                  width: 30,
                                  child: Text(
                                    "16%",
                                    style: TextStyles.bodySmall,
                                  ),
                                ),
                                percent: 0.16,
                                barRadius: const Radius.circular(30),
                                // linearStrokeCap: LinearStrokeCap.round,
                                progressColor: Palette.primaryColor,
                              ),
                              LinearPercentIndicator(
                                clipLinearGradient: true,
                                curve: Curves.easeInCirc,
                                backgroundColor: Palette.whiteColor,
                                width: .35.sw,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 12,
                                leading: SizedBox(
                                  width: 50,
                                  child: Text(
                                    "3 Starts",
                                    style: TextStyles.bodySmall
                                        .copyWith(color: Palette.blackColor),
                                  ),
                                ),
                                trailing: const SizedBox(
                                  width: 30,
                                  child: Text(
                                    "12%",
                                    style: TextStyles.bodySmall,
                                  ),
                                ),
                                percent: 0.12,
                                barRadius: const Radius.circular(30),
                                // linearStrokeCap: LinearStrokeCap.round,
                                progressColor: Palette.primaryColor,
                              ),
                              LinearPercentIndicator(
                                clipLinearGradient: true,
                                curve: Curves.easeInCirc,
                                backgroundColor: Palette.whiteColor,
                                width: .35.sw,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 12,
                                leading: SizedBox(
                                  width: 50,
                                  child: Text(
                                    "2 Starts",
                                    style: TextStyles.bodySmall
                                        .copyWith(color: Palette.blackColor),
                                  ),
                                ),
                                trailing: const SizedBox(
                                  width: 30,
                                  child: Text(
                                    "8%",
                                    style: TextStyles.bodySmall,
                                  ),
                                ),
                                percent: 0.08,
                                barRadius: const Radius.circular(30),
                                // linearStrokeCap: LinearStrokeCap.round,
                                progressColor: Palette.primaryColor,
                              ),
                              LinearPercentIndicator(
                                backgroundColor: Palette.whiteColor,
                                width: .35.sw,
                                animation: true,
                                animationDuration: 1000,
                                lineHeight: 12,
                                leading: SizedBox(
                                  width: 50,
                                  child: Text(
                                    "1 Starts",
                                    style: TextStyles.bodySmall
                                        .copyWith(color: Palette.blackColor),
                                  ),
                                ),
                                trailing: const SizedBox(
                                  width: 30,
                                  child: Text(
                                    "4%",
                                    style: TextStyles.bodySmall,
                                  ),
                                ),
                                percent: 0.04,
                                barRadius: const Radius.circular(30),
                                // linearStrokeCap: LinearStrokeCap.round,
                                progressColor: Palette.primaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ClipOval(
                            child: Image(
                              image: AssetImage(user3),
                              height: 44,
                              width: 44,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Angelina Anderson",
                                  style: TextStyles.titleSmall,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RatingBar.builder(
                                        ignoreGestures: true,
                                        initialRating: 4.5,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 16,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Palette.yellowColor,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      Text(
                                        dateAndTime.format(DateTime.now()),
                                        style: TextStyles.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: const Text(
                                    "nice studio, the app where You can buy Your furniture with just a top without any hassle_ products are realy awesome.....",
                                    style: TextStyles.bodyMedium,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "Read More",
                                  style: TextStyles.bodyMedium.copyWith(
                                    color: Palette.primaryColor,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
