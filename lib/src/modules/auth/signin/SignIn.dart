// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:notary_ping/src/modules/auth/forgot/ForgotPassword.dart';
import 'package:notary_ping/src/modules/auth/signup/SignUp.dart';
import 'package:notary_ping/src/modules/dashboard/DashboardScreen.dart';
import 'package:notary_ping/src/states/signin/LoginController.dart';
import 'package:notary_ping/src/utility/SocialButton.dart';

import '../../../../index.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        children: [
          // Safe area
          const SafeArea(bottom: false, child: SizedBox()),

          // Logo
          Image.asset(
            logo,
            fit: BoxFit.contain,
            height: 60.h,
          ),

          // Title
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
            ),
            child: Text(
              "Let's Sign You In!".tr,
              style: TextStyles.headlineMedium,
            ),
          ),

          // Email or number input field
          CustomTextField(
            hintText: 'Enter your email or number'.tr,
            onChange: (value) {
              controller.state.email = value;
            },
            prefixIcon: emailIcon,
          ),

          SizedBox(height: 16.h),

          // Password input field
          CustomTextField(
            hintText: 'Enter your password'.tr,
            onChange: (value) {
              controller.state.password = value;
            },
            prefixIcon: passwordIcon,
            isuffixIconPassword: true,
          ),

          SizedBox(height: 12.h),

          // Forgot password text
          InkWell(
            onTap: () {
              Get.to(() => ForgotPassword());
            },
            child: Text(
              "Forgot password".tr,
              textAlign: TextAlign.end,
              style: TextStyles.bodyMedium.copyWith(
                color: Palette.primaryColor,
              ),
            ),
          ),

          // Sign In button
          Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: SubmitButton(
              backGroundColor: Palette.primaryColor,
              onTap: () {
                Get.offAll(() => const Dashboard());
              },
              title: "Sign In",
            ),
          ),

          // Sign Up text
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  "Don't Have an account?".tr,
                  style: TextStyles.bodyMedium,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.offAll(() => SignUp()),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(
                    'Sign Up'.tr,
                    style: TextStyles.bodyMedium.copyWith(
                      color: Palette.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Divider
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

          SizedBox(height: 24.h),

          // Social buttons
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

          // Terms of Service and Privacy Policy
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
    );
  }
}
