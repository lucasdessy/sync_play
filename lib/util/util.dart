import 'package:get/get.dart';
import 'package:sync_play/models/app_error.dart';

class Util {
  static void showError(AppError e) {
    Get.snackbar(e.errorDetails == null ? 'Ocorreu um erro' : e.errorTitle,
        e.errorDetails ?? e.errorTitle);
  }
}
