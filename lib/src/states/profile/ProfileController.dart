// ignore_for_file: file_names, avoid_print

import 'package:notary_ping/src/states/profile/ProfileState.dart';

import '../../../index.dart';

class ProfileController extends GetxController {
  final state = ProfileState();
  changeIsShowAnswer(int index) {
    state.filteredFAQS[index].isShowAnswer =
        !state.filteredFAQS[index].isShowAnswer!;
  }
}
