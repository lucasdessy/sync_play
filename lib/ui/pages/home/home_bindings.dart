import 'package:get/get.dart';
import 'package:sync_play/models/app_binding.dart';
import 'package:sync_play/ui/pages/home/tabs/home/home_tab_controller.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/profile_tab_controller.dart';

class HomePageBindings implements AppBinding {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeTabController(), fenix: true);
    Get.lazyPut(() => ProfileTabController(), fenix: true);
  }

  @override
  void destroy() {
    Get.delete<HomeTabController>();
    Get.delete<ProfileTabController>();
  }
}
