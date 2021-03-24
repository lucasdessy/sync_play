import 'package:get/get.dart';
import 'package:sync_play/ui/pages/home/tabs/home/home_tab_controller.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/profile_tab_controller.dart';

class HomePageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeTabController());
    Get.put(ProfileTabController());
  }
}
