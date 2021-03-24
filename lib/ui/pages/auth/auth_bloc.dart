import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:sync_play/models/app_error.dart';
import 'package:sync_play/services/auth_service.dart';
import 'package:sync_play/util/util.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthPageController());
  }
}

class AuthPageController extends GetxController {
  final _authService = Get.find<AuthService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  Future<void> handleLogin() async {
    try {
      await _authService.login(
          email: emailController.text, password: passController.text);
    } on AppError catch (e) {
      Util.showError(e);
    } catch (e) {
      print(e);
    }
  }

  void handleForgotPassword() {}
  void handleRegisterNewAccount() {}
}
