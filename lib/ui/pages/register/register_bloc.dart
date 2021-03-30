import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/models/app_binding.dart';
import 'package:sync_play/models/app_error.dart';
import 'package:sync_play/services/user_service.dart';
import 'package:sync_play/util/util.dart';

class RegisterPageBindings implements AppBinding {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterPageController(), fenix: true);
  }

  @override
  void destroy() {
    Get.delete<RegisterPageController>();
  }
}

class RegisterPageController extends GetxController {
  final _userService = Get.find<UserService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool get loading => _userService.loading();
  Future<void> handleRegister(BuildContext context) async {
    try {
      if (emailController.text.isEmpty || !emailController.text.isEmail) {
        throw AppError('Não é possível se registrar',
            errorDetails: 'Digite um email válido.');
      }
      await _userService.register(
          email: emailController.text, password: passController.text);
    } on AppError catch (e) {
      Util.showError(e, context);
    }
  }

  void handleAlreadyHasAccount(BuildContext context) {
    Navigator.of(context).pop();
  }
}
