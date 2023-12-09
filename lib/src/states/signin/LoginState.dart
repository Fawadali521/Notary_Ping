// ignore_for_file: file_names

import '../../../index.dart';

class LoginState extends LoadingState {
  final RxString _email = ''.obs;
  final RxString _password = ''.obs;
  String? get email => _email.value.trim();
  String? get password => _password.value.trim();
  set email(value) => _email.value = value;
  set password(value) => _password.value = value;
}
