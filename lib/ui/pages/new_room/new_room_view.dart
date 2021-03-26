import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sync_play/ui/components/default_filled_button.dart';
import 'package:sync_play/ui/components/default_label.dart';
import 'package:sync_play/ui/components/default_padding.dart';
import 'package:sync_play/ui/components/default_spacer.dart';
import 'package:sync_play/ui/pages/new_room/new_room_bloc.dart';

class NewRoomView extends GetView<NewRoomController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Criar'),
            previousPageTitle: 'Sync Play',
          ),
          SliverToBoxAdapter(
            child: DefaultPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DefaultLabel('Nome da sala'),
                  CupertinoTextField(
                    controller: controller.nameController,
                  ),
                  DefaultSpacer(),
                  DefaultLabel('Link do youtube (teste)'),
                  CupertinoTextField(
                    controller: controller.linkController,
                  ),
                  DefaultSpacer(),
                  DefaultSpacer(),
                  DefaultSpacer(),
                  DefaultSpacer(),
                  DefaultFilledButton(
                    onPressed: () => controller.goToRoom(context),
                    child: Text('Criar sala'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
