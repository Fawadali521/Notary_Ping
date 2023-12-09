// ignore_for_file: file_names

import 'package:notary_ping/src/modules/auth/signin/SignIn.dart';
import 'package:notary_ping/src/states/onboarding/OnboardingState.dart';

import '../../../index.dart';

class OnboardingController extends GetxController {
  final state = OnboardingState();

  void nextPage() {
    if (state.currentPageIndex.value >= 2) {
      Get.offAll(() => SignIn());
    } else {
      state.currentPageIndex.value++;
    }
  }

  void previousPage() {
    if (state.currentPageIndex.value != 0) {
      state.currentPageIndex.value--;
    }
  }

  void changePage(int value) {
    state.currentPageIndex.value = value;
  }
}
