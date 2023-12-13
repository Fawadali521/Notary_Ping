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
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        children: [
          const SafeArea(bottom: false, child: SizedBox()),
          Image.asset(
            logo,
            fit: BoxFit.contain,
            height: 60.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 24.h,
            ),
            child: Text(
              "Let's Sign You Up!".tr,
              style: TextStyles.headlineMedium,
            ),
          ),
          SizedBox(height: 8.h),
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
            prefixIcon: userIcon,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            hintText: 'Enter your email'.tr,
            onChange: (value) {
              controller.state.email = value;
            },
            prefixIcon: emailIcon,
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: RawAutocomplete<String>(
                  optionsViewBuilder: (BuildContext context,
                      AutocompleteOnSelected<String> onSelected,
                      Iterable<String> options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        elevation: 4.0,
                        child: SizedBox(
                          height: 180.0,
                          width: 100.w,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final String option = options.elementAt(index);
                              return GestureDetector(
                                onTap: () {
                                  onSelected(option);
                                },
                                child: ListTile(
                                  title: Text(option),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  initialValue: const TextEditingValue(
                    text: "+92",
                  ),
                  optionsBuilder: (textValue) {
                    if (textValue.text.isEmpty) {
                      return List.empty();
                    } else {
                      if (textValue.text.length == 1) {
                        controller.state.countryCode.text = "";
                        return controller.state.slectCountryCode.where(
                            (element) => element
                                .toLowerCase()
                                .contains(textValue.text.toLowerCase()));
                      } else {
                        controller.state.countryCode.text = textValue.text;
                        return controller.state.slectCountryCode.where(
                            (element) => element
                                .toLowerCase()
                                .contains(textValue.text.toLowerCase()));
                      }
                    }
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    if (textEditingController.text.isEmpty) {
                      textEditingController.text = "+92";
                    }
                    return CustomTextField(
                      focusnode: focusNode,
                      onEditingComplete: onFieldSubmitted,
                      controller: textEditingController,
                      hintText: ''.tr,
                      onChange: (value) {
                        // controller.state.categoryName = value;
                      },
                    );
                  },
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                flex: 7,
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
          CustomTextField(
            hintText: 'Enter your password'.tr,
            onChange: (value) {
              controller.state.newPassword = value;
            },
            prefixIcon: passwordIcon,
            isuffixIconPassword: true,
          ),

          Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: SubmitButton(
              backGroundColor: Palette.primaryColor,
              onTap: () {
                Get.offAll(() => const Dashboard());
              },
              title: "Sign Up".tr,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  'Already have an account?'.tr,
                  style: TextStyles.bodyMedium,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.offAll(() => SignIn()),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(
                    'Sign In'.tr,
                    style: TextStyles.bodyMedium.copyWith(
                      color: Palette.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
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
          SizedBox(height: 24.h),
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
          // SizedBox(height: 16.h),
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
          SizedBox(height: 36.h)
        ],
      ),
    );
  }
}
