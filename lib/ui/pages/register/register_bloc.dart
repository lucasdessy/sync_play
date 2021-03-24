import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/services/auth_service.dart';

class RegisterPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterPageController());
  }
}

class RegisterPageController extends GetxController {
  final _authService = Get.find<AuthService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void handleRegister(BuildContext context) {
    // TODO
  }
  void handleAlreadyHasAccount() {
    Get.back();
  }
}
