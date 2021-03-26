import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:sync_play/services/route_service.dart';
import 'package:sync_play/ui/pages/home/tabs/home/components/options_sheet.dart';
import 'package:sync_play/ui/pages/new_room/new_room_bloc.dart';

class HomeTabController extends GetxController {
  void handleShowOptions(BuildContext context) {
    showCupertinoModalPopup(
        context: context, builder: (ctx) => OptionsSheet(controller: this));
  }

  Future<void> handleCreateRoom(BuildContext context) async {
    Navigator.of(context).pop();
    NewRoomBindings().dependencies();
    await Navigator.of(context).pushNamed(RouteService.NEW_ROOM);
    NewRoomBindings().destroy();
  }

  void handleJoinRoom(BuildContext context) {
    Navigator.of(context).pop();
  }
}
