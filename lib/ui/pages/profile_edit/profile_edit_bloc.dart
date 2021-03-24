import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class ProfileEditBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileEditController());
  }
}

class ProfileEditController extends GetxController {}
