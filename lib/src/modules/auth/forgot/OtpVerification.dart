// ignore_for_file: file_names

import 'package:notary_ping/src/modules/auth/forgot/ForgotPassword.dart';
import 'package:notary_ping/src/modules/auth/forgot/ResetPassword.dart';
import 'package:notary_ping/src/modules/auth/signin/SignIn.dart';
import 'package:pinput/pinput.dart';

import '../../../../index.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification>
    with TickerProviderStateMixin {
  // final ForgotController controller = Get.find();
  late AnimationController controller;
  int levelClock = 180;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: levelClock,
        ));

    controller.forward();
  }

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
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: GestureDetector(
              //     onTap: () => Get.back(),
              //     child: Padding(
              //       padding:
              //           EdgeInsets.symmetric(horizontal: 0.w, vertical: 14.h),
              //       child: const Icon(
              //         Icons.arrow_back_ios_new_outlined,
              //         color: Palette.blackColor,
              //         size: 16,
              //       ),
              //     ),
              //   ),
              // ),
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
            onCompleted: (pin) {
              print(pin);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Resend OTP".tr,
                  style: TextStyles.bodyMedium.copyWith(
                    fontSize: 16,
                    color: Palette.primaryColor,
                  ),
                ),
                Countdown(
                  animation: StepTween(
                    begin: levelClock, // THIS IS A USER ENTERED NUMBER
                    end: 0,
                  ).animate(controller),
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () => Get.to(() => ForgotPassword()),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(
                    "Wrong Email?".tr,
                    style: TextStyles.bodyLarge,
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Get.offAll(() => SignIn()),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(
                    'Sign In'.tr,
                    style: TextStyles.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
          SubmitButton(
            backGroundColor: Palette.primaryColor,
            onTap: () {
              Get.off(() => const ResetPassword());
            },
            title: "Verify".tr,
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

// ignore: must_be_immutable
class Countdown extends AnimatedWidget {
  Animation<int> animation;

  Countdown({super.key, required this.animation})
      : super(listenable: animation);

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    // print('animation.value  ${animation.value} ');
    // print('inMinutes ${clockTimer.inMinutes.toString()}');
    // print('inSeconds ${clockTimer.inSeconds.toString()}');
    // print(
    //     'inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');

    return Text(
      timerText,
      style: TextStyles.bodyMedium.copyWith(
        fontSize: 16,
        color: Palette.primaryColor,
      ),
    );
  }
}
