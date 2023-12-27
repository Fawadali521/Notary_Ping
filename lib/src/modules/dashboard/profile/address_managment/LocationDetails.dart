// ignore_for_file: non_constant_identifier_names, file_names

import 'package:notary_ping/src/states/profile/ProfileController.dart';
import 'package:notary_ping/src/utility/CustomDropDown.dart';

import '../../../../../index.dart';

LocationDetails(BuildContext context, String address) {
  final ProfileController controller = Get.find<ProfileController>();
  TextEditingController addressController = TextEditingController();
  addressController.text = address;
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
                  Row(
                    children: [
                      Obx(
                        () => CustomDropDown(
                          textStyle: TextStyles.bodyMedium.copyWith(
                            color: Palette.blackColor,
                          ),
                          items: controller.state.slectCountryCode,
                          selectedVal: controller.state.countryCodee.value,
                          onChanged: (val) {
                            controller.changeSelectCountryCode(val!);
                          },
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                          hintText: 'Phone number'.tr,
                          onChange: (value) {
                            // controller.state.confirmPassword = value;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  TextFormField(
                    controller: addressController,
                    textAlignVertical: TextAlignVertical.center,
                    maxLines: 3,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyles.bodyMedium.copyWith(
                      color: Palette.blackColor,
                    ),
                    cursorColor: Palette.blackColor,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                      alignLabelWithHint: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, top: 16, bottom: 50),
                        child: Image.asset(
                          locationIcon,
                          height: 20,
                          width: 20,
                          color: Palette.primaryColor,
                          fit: BoxFit.contain,
                        ),
                      ),
                      fillColor: Palette.bgTextFeildColor,
                      filled: true,
                      hintText: 'Enter your address'.tr,
                      hintStyle: TextStyles.bodyMedium,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderStyles.normal,
                        borderSide: const BorderSide(
                          color: Palette.bgTextFeildColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderStyles.normal,
                        borderSide: const BorderSide(
                          color: Palette.bgTextFeildColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Zip code'.tr,
                    onChange: (value) {},
                    prefixIcon: zipcodeIcon,
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
