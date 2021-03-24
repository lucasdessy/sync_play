import 'package:flutter/cupertino.dart';
import 'package:sync_play/ui/components/default_button.dart';
import 'package:sync_play/ui/components/default_filled_button.dart';
import 'package:sync_play/ui/components/default_padding.dart';
import 'package:sync_play/ui/components/default_spacer.dart';
import 'package:sync_play/ui/components/default_label.dart';
import 'package:sync_play/ui/pages/auth/auth_bloc.dart';

class LoginFields extends StatelessWidget {
  final AuthPageController controller;

  const LoginFields({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DefaultLabel('E-mail'),
          CupertinoTextField(
            controller: controller.emailController,
          ),
          DefaultSpacer(),
          DefaultLabel('Senha'),
          CupertinoTextField(
            controller: controller.passController,
          ),
          DefaultSpacer(),
          DefaultSpacer(),
          DefaultSpacer(),
          DefaultSpacer(), // Gambiarra ne
          DefaultFilledButton(
            onPressed: () => controller.handleLogin(context),
            child: DefaultLabel('Login'),
          ),
          DefaultSpacer(),
          DefaultButton(
            onPressed: () => controller.handleForgotPassword(context),
            child: DefaultLabel('Esqueceu a senha?'),
          ),
          DefaultButton(
            onPressed: () => controller.handleRegisterNewAccount(context),
            child: DefaultLabel('Registrar uma nova conta'),
          ),
        ],
      ),
    );
  }
}
