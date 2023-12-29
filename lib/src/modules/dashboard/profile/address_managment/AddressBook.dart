// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:notary_ping/src/modules/dashboard/profile/address_managment/SelectLocation.dart';
import 'package:notary_ping/src/modules/dashboard/profile/address_managment/UpdateLocation.dart';
import 'package:notary_ping/src/states/profile/ProfileController.dart';

import '../../../../../index.dart';

class AddressBook extends StatelessWidget {
  AddressBook({super.key});
  final ProfileController controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Palette.bgColor,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Address Book'.tr,
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
          ),
          actions: [
            GestureDetector(
              onTap: () => Get.to(() => const SelectLocation()),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  "Add".tr,
                  style: TextStyles.titleSmall.copyWith(
                    color: Palette.primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Card(
            margin: EdgeInsets.zero,
            elevation: 1,
            surfaceTintColor: Palette.whiteColor,
            color: Palette.whiteColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "Fawad Khan",
                          style: TextStyles.titleLarge,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Obx(
                        () => Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            activeColor: Palette.primaryColor,
                            value: controller.state.isNotification.value,
                            onChanged: (value) {
                              controller.state.isNotification.value =
                                  !controller.state.isNotification.value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      InkWell(
                        onTap: () => Get.to(() => const UpdateLocation()),
                        child: Image.asset(
                          editAddressIcon,
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: const Text(
                      "15205 North Kierland Blvd. Suite 100, Cityville, California, United States",
                      style: TextStyles.bodyLarge,
                    ),
                  ),
                  const Text(
                    "(+33) 3489058521",
                    style: TextStyles.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
