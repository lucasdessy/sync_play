import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sync_play/ui/pages/home/tabs/home/home_tab_controller.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: GetBuilder<HomeTabController>(
        builder: (controller) {
          return CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text('Sync Play'),
                trailing: CupertinoButton(
                  onPressed: () => controller.handleShowOptions(context),
                  child: Icon(CupertinoIcons.add),
                ),
              ),
              SliverFillRemaining(
                child: Center(
                  child: Text(
                    'Em breve...',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navLargeTitleTextStyle,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
