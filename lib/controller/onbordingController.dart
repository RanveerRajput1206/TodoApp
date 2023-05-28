import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/authentication/loginscreen.dart';

class OnbordingController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  void nextPage() {
    if (currentPage.value < 2) {
      currentPage.value++;
      pageController.nextPage(
          duration: const Duration(microseconds: 300), curve: Curves.ease);
    }
  }

  void goToLoginPage() {
    Get.off(const LoginPage());
  }
}
