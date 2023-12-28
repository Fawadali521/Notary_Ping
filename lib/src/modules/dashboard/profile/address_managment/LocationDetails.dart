// ignore_for_file: non_constant_identifier_names, file_names

import 'package:country_code_picker/country_code_picker.dart';

import '../../../../../index.dart';

LocationDetails(BuildContext context, String address, String city, String state,
    String country) {
  // final ProfileController controller = Get.find<ProfileController>();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController sateController = TextEditingController();
  TextEditingController countyController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  addressController.text = address;
  cityController.text = city;
  sateController.text = state;
  countyController.text = country;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(
          color: Palette.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: Divider(
                    height: 0,
                    color: Palette.dotColor,
                    thickness: 3,
                    endIndent: .34.sw,
                    indent: .34.sw,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 5, left: 5, top: 12, right: 12),
                      child: Icon(
                        Icons.close,
                        color: Palette.redColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address information".tr,
                    style: TextStyles.titleLarge,
                  ),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    hintText: 'Enter your full name'.tr,
                    onChange: (value) {},
                    prefixIcon: userIcon,
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      // Obx(
                      //   () => CustomDropDown(
                      //     textStyle: TextStyles.bodyMedium.copyWith(
                      //       color: Palette.blackColor,
                      //     ),
                      //     items: controller.state.slectCountryCode,
                      //     selectedVal: controller.state.countryCodee.value,
                      //     onChanged: (val) {
                      //       controller.changeSelectGender(val!);
                      //     },
                      //   ),
                      // ),
                      Container(
                        decoration: BoxDecoration(
                          color: Palette.bgTextFeildColor,
                          borderRadius: BorderStyles.normal,
                          border: Border.all(
                            color: Palette.bgTextFeildColor,
                          ),
                        ),
                        child: CountryCodePicker(
                          textStyle: TextStyles.bodyMedium.copyWith(
                            color: Palette.blackColor,
                          ),
                          dialogTextStyle: TextStyles.bodyMedium.copyWith(
                            color: Palette.blackColor,
                          ),
                          dialogSize: Size(1.sw, 0.8.sh),
                          padding: EdgeInsets.zero,
                          // flagWidth: 24,
                          onChanged: (element) =>
                              debugPrint(element.toLongString()),
                          initialSelection: 'US',
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                          hintText: 'Enter Phone number'.tr,
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Enter your address'.tr,
                    controller: addressController,
                    prefixIcon: locationIcon,
                    maxline: 2,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Enter your city'.tr,
                    controller: cityController,
                    prefixIcon: cityIcon,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Enter your state'.tr,
                    controller: sateController,
                    prefixIcon: stateIcon,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Enter your country'.tr,
                    controller: countyController,
                    prefixIcon: cityIcon,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SubmitButton(
                          title: 'Save Address'.tr,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
