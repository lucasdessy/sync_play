import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/profile_tab_controller.dart';

class ProfileEditView extends StatelessWidget {
  final ProfileTabController controller;

  const ProfileEditView({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Editar'),
          automaticallyImplyLeading: false,
          trailing: Obx(
            () => controller.loading
                ? CupertinoActivityIndicator()
                : CupertinoButton(
                    onPressed: () => controller.handleSaveProfile(context),
                    padding: EdgeInsets.zero,
                    child: Text('Salvar'),
                  ),
          ),
        ),
        child: Container());
  }
}
