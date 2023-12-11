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
        body: Column(
          children: [
            const SafeArea(child: SizedBox()),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Get.offAll(() => SignUp()),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                  child: Text(
                    'Skip'.tr,
                    style: TextStyles.titleSmall,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: controller.state.onboardingDatas.length,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: RichText(
                              text: TextSpan(
                                text: controller
                                    .state
                                    .onboardingDatas[
                                        controller.state.currentPageIndex.value]
                                    .title1
                                    .tr,
                                style: TextStyles.headlineMedium.copyWith(
                                  color:
                                      controller.state.currentPageIndex.value ==
                                              0
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
                                      color: controller.state.currentPageIndex
                                                  .value !=
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
                                      color: controller.state.currentPageIndex
                                                  .value ==
                                              0
                                          ? Palette.primaryColor
                                          : Palette.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              controller
                                  .state
                                  .onboardingDatas[
                                      controller.state.currentPageIndex.value]
                                  .description
                                  .tr,
                              style: TextStyles.bodyMedium,
                            ),
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
                      ),
                    ],
                  );
                },
                onPageChanged: (value) {
                  controller.changePage(value);
                },
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
                  padding: EdgeInsets.only(left: 20.w, top: 20),
                  child: DotsIndicator(
                    dotsCount: controller.state.onboardingDatas.length,
                    position: controller.state.currentPageIndex.value,
                    mainAxisAlignment: MainAxisAlignment.start,
                    decorator: DotsDecorator(
                      color: Palette.primaryColor.withOpacity(0.5),
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
                    height: 110,
                    width: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.bottomRight,
                        image: AssetImage(
                          nextButtonIcon,
                        ),
                      ),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12, top: 20),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 32,
                          color: Palette.whiteColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
