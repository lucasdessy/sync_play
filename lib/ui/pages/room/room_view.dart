import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/ui/pages/room/components/chat_builder.dart';
import 'package:sync_play/ui/pages/room/components/player.dart';
import 'room_bloc.dart';

class RoomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomController>(
      init: Get.put(
        RoomController(),
      ),
      dispose: (state) {
        Get.find<RoomController>().disposeControllers();
        RoomBindings().destroy();
      },
      builder: (c) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Sala'),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => c.changeResolution(context),
            child: Icon(CupertinoIcons.settings),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              GetBuilder<RoomController>(
                  id: 'player',
                  builder: (controller) {
                    return Material(
                      child: Player(
                        controller: controller,
                      ),
                    );
                  }),
              GetBuilder<RoomController>(
                  id: 'chat',
                  builder: (controller) {
                    return Expanded(
                      child: ChatBuilder(),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
