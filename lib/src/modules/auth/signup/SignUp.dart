// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:notary_ping/src/modules/auth/signin/SignIn.dart';
import 'package:notary_ping/src/modules/dashboard/DashboardScreen.dart';
import 'package:notary_ping/src/states/signup/SignUpController.dart';
import 'package:notary_ping/src/utility/CustomDivider.dart';
import 'package:notary_ping/src/utility/SocialButton.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';

import '../../../../index.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
          children: [
            Image.asset(
              logo,
              fit: BoxFit.contain,
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 18.h,
              ),
              child: Text(
                "Register".tr,
                style: TextStyles.headlineMedium,
              ),
            ),
            Text(
              "Create your account now".tr,
              style: TextStyles.bodyMedium,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: 'Enter your name'.tr,
              onChange: (value) {
                controller.state.name = value;
              },
              validator: controller.validateName,
              prefixIcon: userIcon,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              hintText: 'Enter your email'.tr,
              onChange: (value) {
                controller.state.email = value;
              },
              validator: controller.validateEmail,
              prefixIcon: emailIcon,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              hintText: 'Enter your password'.tr,
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
              padding: EdgeInsets.symmetric(vertical: 28.h),
              child: SubmitButton(
                backGroundColor: Palette.primaryColor,
                onTap: () {
                  Get.offAll(() => const Dashboard());
                },
                title: "Sign up".tr,
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: CustomDivider(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    "or".tr,
                    style: TextStyles.bodyLarge,
                  ),
                ),
                const Expanded(
                  child: CustomDivider(),
                ),
              ],
            ),
            SizedBox(height: 28.h),
            SocialButton(
              onTap: () {},
              status: "GO",
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: SocialButton(
                onTap: () {},
                status: "AP",
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Have an account?'.tr,
                    style: TextStyles.bodyMedium,
                  ),
                  TextSpan(
                    text: 'Login'.tr,
                    style: TextStyles.bodyMedium
                        .copyWith(color: Palette.primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.offAll(() => SignIn());
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'By signing in you accept our'.tr,
                    style: TextStyles.bodyMedium,
                  ),
                  TextSpan(
                      text: 'Terms of Services'.tr,
                      style: TextStyles.bodyMedium
                          .copyWith(color: Palette.primaryColor),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                  TextSpan(
                    text: 'and'.tr,
                    style: TextStyles.bodyMedium,
                  ),
                  TextSpan(
                      text: 'Privacy Policy.'.tr,
                      style: TextStyles.bodyMedium
                          .copyWith(color: Palette.primaryColor),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                ],
              ),
            ),
            SizedBox(height: 12.h)
          ],
        ),
      ),
    );
  }
}
