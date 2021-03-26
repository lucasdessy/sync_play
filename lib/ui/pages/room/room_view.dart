import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/ui/pages/room/components/chat_builder.dart';

import 'components/player.dart';
import 'room_bloc.dart';

class RoomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Sala'),
      ),
      child: SafeArea(
        child: GetBuilder<RoomController>(
          builder: (controller) {
            return Column(
              children: [
                Player(
                  controller: controller,
                ),
                Expanded(
                  child: ChatBuilder(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
