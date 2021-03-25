import 'package:get/get.dart';
import 'package:sync_play/models/app_binding.dart';

class HistoryPageBindings implements AppBinding {
  @override
  void dependencies() {
    Get.put(HistoryPageController());
  }

  @override
  void destroy() {
    Get.delete<HistoryPageController>();
  }
}

class HistoryPageController extends GetxController {}
