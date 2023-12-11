// ignore_for_file: file_names

import 'package:notary_ping/src/modules/auth/forgot/ResetPassword.dart';
import 'package:notary_ping/src/states/forgot/ForgotController.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';
import 'package:pinput/pinput.dart';

import '../../../../index.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({Key? key}) : super(key: key);
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
          const SafeArea(child: SizedBox()),
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
              "OTP Verification".tr,
              style: TextStyles.headlineMedium,
            ),
          ),
          Text(
            "otpDescription".tr,
            style: TextStyles.bodyMedium,
          ),
          SizedBox(height: 32.h),
          Pinput(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            length: 4,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme,
            submittedPinTheme: defaultPinTheme,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: Text(
                "Resend OTP".tr,
                style: TextStyles.bodyMedium.copyWith(
                  fontSize: 16,
                  color: Palette.primaryColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 38.h),
            child: SubmitButton(
              backGroundColor: Palette.primaryColor,
              onTap: () {
                Get.to(() => ResetPassword());
              },
              title: "Verify".tr,
            ),
          ),
          SizedBox(height: 12.h)
        ],
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 60.w,
    height: 60.w,
    textStyle: TextStyles.titleLarge,
    decoration: const BoxDecoration(
      borderRadius: BorderStyles.buttonRadius,
      color: Palette.bgTextFeildColor,
    ),
  );
}
