import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sync_play/ui/components/default_label.dart';
import 'package:sync_play/ui/components/default_padding.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/profile_tab_controller.dart';

class ProfileEditView extends StatelessWidget {
  final ProfileTabController controller;

  const ProfileEditView({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.profileEditViewOnWillPop(context),
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
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
        child: DefaultPadding(
          child: ListView(
            controller: ModalScrollController.of(context),
            children: [
              CupertinoFormSection.insetGrouped(children: [Text('a')])
            ],
          ),
        ),
      ),
    );
  }
}
