import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/components/profile_section.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/profile_tab_controller.dart';

class ProfileTab extends GetView<ProfileTabController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Perfil'),
          ),
          SliverToBoxAdapter(
            child: ProfileSection(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
