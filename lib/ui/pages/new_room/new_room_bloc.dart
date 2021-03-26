import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/models/app_binding.dart';
import 'package:sync_play/models/room.dart';
import 'package:sync_play/services/route_service.dart';

class NewRoomBindings implements AppBinding {
  @override
  void dependencies() {
    Get.put<NewRoomController>(NewRoomController());
  }

  @override
  void destroy() {
    Get.delete<NewRoomController>();
  }
}

class NewRoomController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  Future<void> goToRoom(BuildContext context) async {
    await Navigator.of(context).pushReplacementNamed(RouteService.ROOM,
        arguments: Room(nameController.text, linkController.text));
  }
}
