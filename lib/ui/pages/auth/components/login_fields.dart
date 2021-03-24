import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DefaultLabel('E-mail'),
            CupertinoTextField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              autofillHints: [AutofillHints.email],
            ),
            DefaultSpacer(),
            DefaultLabel('Senha'),
            CupertinoTextField(
              controller: controller.passController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              autofillHints: [AutofillHints.password],
            ),
            DefaultSpacer(),
            DefaultSpacer(),
            DefaultSpacer(),
            DefaultSpacer(), // Gambiarra ne
            DefaultFilledButton(
              onPressed: controller.loading
                  ? null
                  : () => controller.handleLogin(context),
              child: Text('Login'),
            ),
            DefaultSpacer(),
            DefaultButton(
              onPressed: controller.loading
                  ? null
                  : () => controller.handleForgotPassword(context),
              child: Text('Esqueceu a senha?'),
            ),
            DefaultButton(
              onPressed: controller.loading
                  ? null
                  : () => controller.handleRegisterNewAccount(context),
              child: Text('Registrar uma nova conta'),
            ),
          ],
        ),
      ),
    );
  }
}
