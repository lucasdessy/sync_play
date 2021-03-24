import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:sync_play/ui/pages/home/tabs/home/home_tab_controller.dart';

class OptionsSheet extends StatelessWidget {
  final HomeTabController controller;

  const OptionsSheet({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () => controller.handleCreateRoom(context),
          isDefaultAction: true,
          child: Text('Criar nova sala'),
        ),
        CupertinoActionSheetAction(
          onPressed: () => controller.handleJoinRoom(context),
          child: Text('Juntar-se a uma sala'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Get.back();
        },
        child: Text('Dispensar'),
      ),
    );
  }
}
