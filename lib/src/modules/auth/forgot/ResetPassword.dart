// ignore_for_file: file_names

import 'package:notary_ping/src/modules/auth/signin/SignIn.dart';
import 'package:notary_ping/src/states/forgot/ForgotController.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';

import '../../../../index.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  final ForgotController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        children: [
          const SafeArea(bottom: false, child: SizedBox()),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                logo,
                fit: BoxFit.contain,
                height: 60.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 14.h),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Palette.blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 18.h,
            ),
            child: Text(
              "Reset password".tr,
              style: TextStyles.headlineMedium,
            ),
          ),
          Text(
            "resetDescription".tr,
            style: TextStyles.bodyMedium,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            hintText: 'Enter new password'.tr,
            onChange: (value) {
              controller.state.newPassword = value;
            },
            validator: controller.validatePassword,
            prefixIcon: passwordIcon,
            isuffixIconPassword: true,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            hintText: 'confirmPassword'.tr,
            onChange: (value) {
              controller.state.confirmPassword = value;
            },
            validator: controller.validateConfirmPassword,
            prefixIcon: passwordIcon,
            isuffixIconPassword: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 38.h),
            child: SubmitButton(
              backGroundColor: Palette.primaryColor,
              onTap: () {
                Get.offAll(() => SignIn());
              },
              title: "Reset password".tr,
            ),
          ),
          SizedBox(height: 12.h)
        ],
      ),
    );
  }
}
