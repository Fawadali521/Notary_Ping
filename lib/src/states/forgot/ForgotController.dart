// ignore_for_file: file_names

import 'package:notary_ping/src/states/forgot/ForgotState.dart';

import '../../../index.dart';

class ForgotController extends GetxController {
  final state = ForgotState();
  final forgotUpdateFormKey = GlobalKey<FormState>();
  final forgotFormKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required'.tr;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'emailaddress'.tr;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required'.tr;
    }
    if (value.length < 8) {
      return '8characterslong'.tr;
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required'.tr;
    }
    if (value != state.newPassword) {
      return 'ConfirmPassword'.tr;
    }
    return null;
  }
}
