

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with GetTickerProviderStateMixin{
  late TabController tabController;
  var isChecked = false.obs;

  // Function to toggle checkbox state
  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this);

  }

}
