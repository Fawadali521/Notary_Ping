// ignore_for_file: file_names

import 'package:notary_ping/src/modules/auth/forgot/OtpVerification.dart';
import 'package:notary_ping/src/states/forgot/ForgotController.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';

import '../../../../index.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final ForgotController controller = Get.put(ForgotController());
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
                "Forgot password?".tr,
                style: TextStyles.headlineMedium,
              ),
            ),
            Text(
              "foegotDescription".tr,
              style: TextStyles.bodyMedium,
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              hintText: 'Enter your email'.tr,
              onChange: (value) {
                controller.state.email = value;
              },
              validator: controller.validateEmail,
              prefixIcon: emailIcon,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 38.h),
              child: SubmitButton(
                backGroundColor: Palette.primaryColor,
                onTap: () {
                  Get.to(() => OtpVerification());
                },
                title: "send".tr,
              ),
            ),
            SizedBox(height: 12.h)
          ],
        ),
      ),
    );
  }
}
