// ignore_for_file: file_names

import 'package:notary_ping/src/states/profile/ProfileController.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';

import '../../../../index.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final ProfileController controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: CustomAppBar(
        color: Palette.whiteColor,
        title: 'Change password'.tr,
        isBack: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              "Change password".tr,
              style: TextStyles.titleLarge,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              hintText: 'Enter current password'.tr,
              onChange: (value) {
                // controller.state.name = value;
              },
              prefixIcon: passwordIcon,
              isuffixIconPassword: true,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              hintText: 'Enter new password'.tr,
              onChange: (value) {
                // controller.state.name = value;
              },
              prefixIcon: passwordIcon,
              isuffixIconPassword: true,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              hintText: 'Confirm password'.tr,
              onChange: (value) {
                // controller.state.name = value;
              },
              prefixIcon: passwordIcon,
              isuffixIconPassword: true,
            ),
            SizedBox(height: 16.h),
            SizedBox(height: 80.h),
            SubmitButton(
              title: 'Change'.tr,
              onTap: () {},
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
