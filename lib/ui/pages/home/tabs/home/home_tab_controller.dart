import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:sync_play/ui/pages/home/tabs/home/components/options_sheet.dart';

class HomeTabController extends GetxController {
  void handleShowOptions(BuildContext context) {
    showCupertinoModalPopup(
        context: context, builder: (ctx) => OptionsSheet(controller: this));
  }

  void handleCreateRoom(BuildContext context) {
    Navigator.of(context).pop();
  }

  void handleJoinRoom(BuildContext context) {
    Navigator.of(context).pop();
  }
}
