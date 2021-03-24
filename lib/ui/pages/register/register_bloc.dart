import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/models/app_error.dart';
import 'package:sync_play/services/auth_service.dart';
import 'package:sync_play/util/util.dart';

class RegisterPageBindings {
  static void dependencies() {
    Get.lazyPut(() => RegisterPageController(), fenix: true);
  }

  static void destroy() {
    Get.delete<RegisterPageController>();
  }
}

class RegisterPageController extends GetxController {
  final _authService = Get.find<AuthService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool get loading => _authService.loading() ?? false;
  Future<void> handleRegister(BuildContext context) async {
    try {
      if (emailController.text.isEmpty || !emailController.text.isEmail) {
        throw AppError('Não é possível se registrar',
            errorDetails: 'Digite um email válido.');
      }
      await _authService.register(
          email: emailController.text, password: passController.text);
    } on AppError catch (e) {
      Util.showError(e, context);
    }
  }

  void handleAlreadyHasAccount(BuildContext context) {
    Navigator.of(context).pop();
  }
}
