// ignore_for_file: file_names

import 'package:dots_indicator/dots_indicator.dart';
import 'package:notary_ping/src/modules/auth/signup/SignUp.dart';
import 'package:notary_ping/src/states/onboarding/OnboardingController.dart';

import '../../../../index.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        backgroundColor: Palette.bgOnboardingColor,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.state.currentPageIndex.value == 0
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () => controller.previousPage(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 14.h),
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Palette.blackColor,
                            ),
                          ),
                        ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.offAll(() => SignUp()),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 14.h),
                      child: Text(
                        'Skip'.tr,
                        style: TextStyles.titleSmall,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: PageView.builder(
                    itemCount: controller.state.onboardingDatas.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          controller.state.currentPageIndex.value != 1
                              ? Expanded(
                                  child: Image.asset(
                                    controller
                                        .state
                                        .onboardingDatas[controller
                                            .state.currentPageIndex.value]
                                        .imgUrl,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(height: 8.h),
                          RichText(
                            text: TextSpan(
                              text: controller
                                  .state
                                  .onboardingDatas[
                                      controller.state.currentPageIndex.value]
                                  .title1
                                  .tr,
                              style: TextStyles.headlineMedium.copyWith(
                                color:
                                    controller.state.currentPageIndex.value == 0
                                        ? Palette.primaryColor
                                        : Palette.blackColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: controller
                                      .state
                                      .onboardingDatas[controller
                                          .state.currentPageIndex.value]
                                      .title2
                                      .tr,
                                  style: TextStyles.headlineMedium.copyWith(
                                    color: controller
                                                .state.currentPageIndex.value !=
                                            0
                                        ? Palette.primaryColor
                                        : Palette.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: controller
                                      .state
                                      .onboardingDatas[controller
                                          .state.currentPageIndex.value]
                                      .title3
                                      .tr,
                                  style: TextStyles.headlineMedium.copyWith(
                                    color: controller
                                                .state.currentPageIndex.value ==
                                            0
                                        ? Palette.primaryColor
                                        : Palette.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            controller
                                .state
                                .onboardingDatas[
                                    controller.state.currentPageIndex.value]
                                .description
                                .tr,
                            style: TextStyles.bodyMedium,
                          ),
                          controller.state.currentPageIndex.value == 1
                              ? Expanded(
                                  child: Image.asset(
                                    controller
                                        .state
                                        .onboardingDatas[controller
                                            .state.currentPageIndex.value]
                                        .imgUrl,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      );
                    },
                    onPageChanged: (value) {
                      controller.changePage(value);
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              ///
              /// Dots indicator and buttons
              ///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: DotsIndicator(
                      dotsCount: controller.state.onboardingDatas.length,
                      position: controller.state.currentPageIndex.value,
                      mainAxisAlignment: MainAxisAlignment.start,
                      decorator: DotsDecorator(
                        color: Palette.lightBlue,
                        activeColor: Palette.primaryColor,
                        size: const Size(12.0, 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        activeSize: const Size(20.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.nextPage(),
                    child: Container(
                      height: 150.h,
                      width: 80.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.topRight,
                          image: AssetImage(
                            nextButtonIcon,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward,
                          size: 32,
                          color: Palette.whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
