import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sync_play/ui/components/default_button.dart';
import 'package:sync_play/ui/components/default_filled_button.dart';
import 'package:sync_play/ui/components/default_padding.dart';
import 'package:sync_play/ui/components/default_spacer.dart';
import 'package:sync_play/ui/components/default_label.dart';
import 'package:sync_play/ui/pages/register/register_bloc.dart';

class RegisterFields extends StatelessWidget {
  final RegisterPageController controller;

  const RegisterFields({Key? key, required this.controller}) : super(key: key);
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
              autofillHints: [AutofillHints.newUsername],
            ),
            DefaultSpacer(),
            DefaultLabel('Senha'),
            CupertinoTextField(
              controller: controller.passController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              autofillHints: [AutofillHints.newPassword],
            ),
            DefaultSpacer(),
            DefaultSpacer(),
            DefaultSpacer(),
            DefaultSpacer(), // Gambiarra ne
            DefaultFilledButton(
              onPressed: controller.loading
                  ? null
                  : () => controller.handleRegister(context),
              child: Text('Registrar'),
            ),
            DefaultSpacer(),
            DefaultButton(
              onPressed: controller.loading
                  ? null
                  : () => controller.handleAlreadyHasAccount(context),
              child: Text('Já tem uma conta?'),
            ),
          ],
        ),
      ),
    );
  }
}
