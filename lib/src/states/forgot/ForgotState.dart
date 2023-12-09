// ignore_for_file: file_names

import '../../../index.dart';

class ForgotState extends LoadingState {
  final RxString _email = ''.obs;
  final RxString _newPassword = ''.obs;
  final RxString _confirmPassword = ''.obs;
  String? get email => _email.value.trim();
  String? get newPassword => _newPassword.value.trim();
  String? get confirmPassword => _confirmPassword.value.trim();
  set email(value) => _email.value = value;
  set newPassword(value) => _newPassword.value = value;
  set confirmPassword(value) => _confirmPassword.value = value;
}
