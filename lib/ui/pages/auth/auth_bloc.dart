import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:sync_play/models/app_error.dart';
import 'package:sync_play/services/auth_service.dart';
import 'package:sync_play/services/route_service.dart';
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
  Future<void> handleLogin(BuildContext context) async {
    try {
      if (emailController.text.isEmpty || !emailController.text.isEmail) {
        throw AppError('Não é possível fazer login',
            errorDetails: 'Digite um email válido.');
      }
      await _authService.login(
          email: emailController.text, password: passController.text);
    } on AppError catch (e) {
      Util.showError(e, context);
    }
  }

  Future<void> handleForgotPassword(BuildContext context) async {
    try {
      if (emailController.text.isEmpty || !emailController.text.isEmail) {
        throw AppError('Não é possível recuperar a senha',
            errorDetails: 'Digite um email válido.');
      }
      await _authService.recoverPassword(
        email: emailController.text,
      );
      Util.showSnackbar(context,
          title: 'Sucesso',
          details: 'Email de recuperação enviado com sucesso');
    } on AppError catch (e) {
      Util.showError(e, context);
    }
  }

  void handleRegisterNewAccount(BuildContext context) {
    Get.toNamed(RouteService.REGISTER);
  }
}
