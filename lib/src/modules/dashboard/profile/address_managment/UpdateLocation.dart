// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:country_code_picker/country_code_picker.dart';
import 'package:notary_ping/src/modules/dashboard/DashboardScreen.dart';
import 'package:notary_ping/src/states/profile/ProfileController.dart';

import '../../../../../index.dart';

class UpdateLocation extends StatefulWidget {
  const UpdateLocation({
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateLocation> createState() => _UpdateLocationState();
}

class _UpdateLocationState extends State<UpdateLocation> {
  final ProfileController controller = Get.find<ProfileController>();
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController sateController = TextEditingController();
  TextEditingController countyController = TextEditingController();

  @override
  void initState() {
    addressController.text = "15205 North Kierland Blvd. Suite 100";
    nameController.text = "Fawad";
    phoneController.text = "3345233543";
    cityController.text = "Cityville";
    sateController.text = "California";
    countyController.text = "United States";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: CustomAppBar(
        color: Palette.whiteColor,
        title: 'Update Address'.tr,
        isBack: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Text(
            "Address information".tr,
            style: TextStyles.titleLarge,
          ),
          SizedBox(height: 12.h),
          CustomTextField(
            hintText: 'Enter your full name'.tr,
            controller: nameController,
            prefixIcon: userIcon,
          ),
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
                  onChanged: (element) => debugPrint(element.toLongString()),
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
          SizedBox(height: 80.h),
          SubmitButton(
            title: 'Update Address'.tr,
            onTap: () => Get.to(() => const Dashboard()),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
