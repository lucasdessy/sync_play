import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sync_play/ui/pages/home/tabs/home/home_tab_controller.dart';

class HomeTab extends GetView<HomeTabController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Sync Play'),
            trailing: CupertinoButton(
              onPressed: () => controller.handleShowOptions(context),
              child: Icon(CupertinoIcons.add),
            ),
          ),
        ],
      ),
    );
  }
}
