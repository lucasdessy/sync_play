import 'package:get/get.dart';
import 'package:sync_play/ui/pages/home/tabs/home/home_tab_controller.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/profile_tab_controller.dart';

class HomePageBindings {
  static void dependencies() {
    Get.lazyPut(() => HomeTabController(), fenix: true);
    Get.lazyPut(() => ProfileTabController(), fenix: true);
  }

  static void destroy() {
    Get.delete<HomeTabController>();
    Get.delete<ProfileTabController>();
  }
}
