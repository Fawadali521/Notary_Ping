// ignore_for_file: file_names

import 'package:notary_ping/src/models/OnboardingModel.dart';

import '../../../index.dart';

class OnboardingState extends LoadingState {
  final RxInt currentPageIndex = 0.obs;

  RxList<OnboardingModel> onboardingDatas = [
    OnboardingModel(
      imgUrl: onbording1,
      title1: 'Connect face-to-face'.tr,
      title2: 'with a registered'.tr,
      title3: 'notary'.tr,
      description: "oboardingDescription1".tr,
    
    ),
    OnboardingModel(
      imgUrl: onbording2,
      title1: 'Notaryping instant,'.tr,
      title2: 'secure notarization'.tr,
      title3: 'anytime, anywhere'.tr,
      description: "oboardingDescription2".tr,
    
    ),
    OnboardingModel(
      imgUrl: onbording3,
      title1: 'Certified notaries'.tr,
      title2: 'seal with confidence'.tr,
      title3: 'notary'.tr,
      description: "oboardingDescription3".tr,
     
    ),
  ].obs;
}
