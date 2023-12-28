// ignore_for_file: file_names

import 'package:country_code_picker/country_code_picker.dart';
import 'package:notary_ping/src/states/profile/ProfileController.dart';

import '../../../../index.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ProfileController controller = Get.find<ProfileController>();

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    nameController.text = "Fawad";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: CustomAppBar(
        color: Palette.whiteColor,
        title: 'Edit Profile'.tr,
        isBack: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                          height: 80,
                          width: 80,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Palette.primaryColor,
                        radius: 10,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Palette.whiteColor,
                          size: 12,
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
          SizedBox(height: 12.h),
          CustomTextField(
            hintText: 'Enter your name'.tr,
            controller: nameController,
            prefixIcon: userIcon,
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Palette.bgTextFeildColor,
                  borderRadius: BorderStyles.normal,
                  border: Border.all(
                    color: Palette.bgTextFeildColor,
                  ),
                ),
                child: CountryCodePicker(
                  enabled: false,
                  textStyle: TextStyles.bodyMedium.copyWith(
                    color: Palette.blackColor,
                  ),
                  dialogTextStyle: TextStyles.bodyMedium.copyWith(
                    color: Palette.blackColor,
                  ),
                  dialogSize: Size(1.sw, 0.8.sh),
                  padding: EdgeInsets.zero,
                  // flagWidth: 24,
                  onChanged: (element) => debugPrint(element.toLongString()),
                  initialSelection: 'US',
                ),
              ),

              // Obx(
              //   () => CustomDropDown(
              //     textStyle: TextStyles.bodyMedium.copyWith(
              //       color: Palette.blackColor,
              //     ),
              //     items: controller.state.slectCountryCode,
              //     selectedVal: controller.state.countryCodee.value,
              //     onChanged: (val) {
              //       controller.changeSelectCountryCode(val!);
              //     },
              //   ),
              // ),
              SizedBox(width: 8.w),
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 16.w, right: 16.w, top: 16.h, bottom: 16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderStyles.normal,
                      color: Palette.bgTextFeildColor,
                      border: Border.all(
                        color: Palette.bgTextFeildColor,
                      ),
                    ),
                    child: Text(
                      "3468098665",
                      style: TextStyles.bodyMedium.copyWith(
                        color: Palette.blackColor,
                      ),
                    ),
                  )

                  // CustomTextField(
                  //   hintText: 'Phone number'.tr,
                  //   controller: phoneController,
                  //   keyboardType: TextInputType.number,
                  // ),
                  ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 16.h, bottom: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderStyles.normal,
              color: Palette.bgTextFeildColor,
              border: Border.all(
                color: Palette.bgTextFeildColor,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  locationIcon,
                  height: 20,
                  width: 20,
                  color: Palette.primaryColor,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    "15205 North Kierland Blvd. Suite 100", //address
                    style: TextStyles.bodyMedium.copyWith(
                      color: Palette.blackColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 16.h, bottom: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderStyles.normal,
              color: Palette.bgTextFeildColor,
              border: Border.all(
                color: Palette.bgTextFeildColor,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  cityIcon,
                  height: 20,
                  width: 20,
                  color: Palette.primaryColor,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    "Cityville", //city
                    style: TextStyles.bodyMedium.copyWith(
                      color: Palette.blackColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 16.h, bottom: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderStyles.normal,
              color: Palette.bgTextFeildColor,
              border: Border.all(
                color: Palette.bgTextFeildColor,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  stateIcon,
                  height: 20,
                  width: 20,
                  color: Palette.primaryColor,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    "California", //state
                    style: TextStyles.bodyMedium.copyWith(
                      color: Palette.blackColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 16.h, bottom: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderStyles.normal,
              color: Palette.bgTextFeildColor,
              border: Border.all(
                color: Palette.bgTextFeildColor,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  cityIcon,
                  height: 20,
                  width: 20,
                  color: Palette.primaryColor,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    "United States", // cpuntry
                    style: TextStyles.bodyMedium.copyWith(
                      color: Palette.blackColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 80.h),
          SubmitButton(
            title: 'Update'.tr,
            onTap: () {},
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
