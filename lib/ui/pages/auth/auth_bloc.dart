import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:sync_play/models/app_binding.dart';
import 'package:sync_play/models/app_error.dart';
import 'package:sync_play/services/user_service.dart';
import 'package:sync_play/services/route_service.dart';
import 'package:sync_play/util/util.dart';

class AuthBindings implements AppBinding {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthPageController(), fenix: true);
  }

  @override
  void destroy() {
    Get.delete<AuthPageController>();
  }
}

class AuthPageController extends GetxController {
  final _userService = Get.find<UserService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool get loading => _userService.loading() ?? false;

  Future<void> handleLogin(BuildContext context) async {
    try {
      if (emailController.text.isEmpty || !emailController.text.isEmail) {
        throw AppError('Não é possível fazer login',
            errorDetails: 'Digite um email válido.');
      }
      await _userService.login(
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
      await _userService.recoverPassword(
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
    Navigator.of(context).pushNamed(RouteService.REGISTER);
  }
}
