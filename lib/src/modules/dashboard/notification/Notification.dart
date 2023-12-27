// ignore_for_file: file_names

import 'package:flutter_slidable_panel/controllers/slide_controller.dart';
import 'package:flutter_slidable_panel/widgets/slidable_panel.dart';

import '../../../../index.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int isSelect = -1;
  final List<SlideController> slideController = [
    SlideController(),
    SlideController(),
    SlideController(),
    SlideController(),
    SlideController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            backgroundColor: Palette.bgColor,
            surfaceTintColor: Palette.bgColor,
            centerTitle: true,
            title: Text(
              'Notification'.tr,
              style: TextStyles.headlineLarge,
            ),
            elevation: 0,
            leading: InkWell(
              onTap: () => Get.back(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Palette.blackColor,
                  size: 16,
                ),
              ),
            )),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today".tr,
                  style: TextStyles.titleLarge,
                ),
                Text(
                  "2 hours ago".tr,
                  style: TextStyles.bodyMedium,
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return SlidablePanel(
                onSlideStart: () {
                  setState(() {
                    isSelect = index;
                  });
                },
                controller: slideController[1],
                maxSlideThreshold: 0.17,
                axis: Axis.horizontal,
                postActions: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w, right: 16.w),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Palette.whiteColor,
                      child: Image.asset(
                        deleteIcon,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ],
                child: Container(
                  margin: EdgeInsets.only(top: 16.h, left: 20.w, right: 20.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderStyles.medium,
                    color: Palette.whiteColor,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          user,
                          fit: BoxFit.fill,
                          height: 70,
                          width: 70,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "You have a new appointment request".tr,
                              style: TextStyles.titleLarge,
                            ),
                            Text(
                              "2 hours ago".tr,
                              style: TextStyles.bodyMedium,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return SlidablePanel(
                onSlideStart: () {
                  setState(() {
                    isSelect = index;
                  });
                },
                controller: slideController[0],
                maxSlideThreshold: 0.17,
                axis: Axis.horizontal,
                postActions: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.w, right: 16.w),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Palette.whiteColor,
                      child: Image.asset(
                        deleteIcon,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ],
                child: Container(
                  margin: EdgeInsets.only(top: 16.h, left: 20.w, right: 20.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderStyles.medium,
                    color: Palette.whiteColor,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          user4,
                          fit: BoxFit.fill,
                          height: 70,
                          width: 70,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Stephen Lang".tr,
                                    style: TextStyles.titleLarge,
                                  ),
                                  TextSpan(
                                    text: " sent you a message".tr,
                                    style: TextStyles.titleLarge.copyWith(
                                      color: Palette.greyTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "2 hours ago".tr,
                              style: TextStyles.bodyMedium,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
