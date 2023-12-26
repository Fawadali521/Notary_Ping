// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:notary_ping/src/modules/dashboard/DashboardScreen.dart';
import 'package:notary_ping/src/states/profile/ProfileController.dart';
import 'package:notary_ping/src/utility/CustomDropDown.dart';

import '../../../../../index.dart';

class UpdateLocation extends StatefulWidget {
  final String location;
  const UpdateLocation({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  State<UpdateLocation> createState() => _UpdateLocationState();
}

class _UpdateLocationState extends State<UpdateLocation> {
  final ProfileController controller = Get.find<ProfileController>();
  TextEditingController addressController = TextEditingController();
  @override
  void initState() {
    addressController.text = widget.location;
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
      body: Stack(
        children: [
          ListView(
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
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SubmitButton(
                    title: 'Update Address'.tr,
                    onTap: () => Get.to(() => const Dashboard()),
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
