import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class RegisterPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterPageController());
  }
}

class RegisterPageController extends GetxController {}
