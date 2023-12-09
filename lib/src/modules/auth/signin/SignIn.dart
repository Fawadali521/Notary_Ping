// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:notary_ping/src/modules/auth/forgot/ForgotPassword.dart';
import 'package:notary_ping/src/modules/auth/signup/SignUp.dart';
import 'package:notary_ping/src/modules/dashboard/DashboardScreen.dart';
import 'package:notary_ping/src/states/signin/LoginController.dart';
import 'package:notary_ping/src/utility/CustomDivider.dart';
import 'package:notary_ping/src/utility/SocialButton.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';

import '../../../../index.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final LoginController controller = Get.put(LoginController());
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
                vertical: 24.h,
              ),
              child: Text(
                "Let's Sign You In!".tr,
                style: TextStyles.headlineMedium,
              ),
            ),
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
                controller.state.password = value;
              },
              validator: controller.validatePassword,
              prefixIcon: passwordIcon,
              isuffixIconPassword: true,
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => ForgotPassword());
                  },
                  child: Text(
                    "Forgot password".tr,
                    style: TextStyles.bodyMedium.copyWith(
                      color: Palette.primaryColor,
                    ),
                  ),
                ),
                InkWell(
                    onTap: () => Get.offAll(() => SignUp()),
                    child: Text(
                      "Sign up!".tr,
                      style: TextStyles.bodyMedium.copyWith(
                        color: Palette.primaryColor,
                      ),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 28.h),
              child: SubmitButton(
                backGroundColor: Palette.primaryColor,
                onTap: () {
                  Get.offAll(() => const Dashboard());
                },
                title: "Sign in",
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
          ],
        ),
      ),
    );
  }
}
