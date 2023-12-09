// ignore_for_file: file_names

import 'package:get/get.dart';

class LoadingState {
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;
}
