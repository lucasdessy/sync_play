import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/models/app_error.dart';

class Util {
  /// Shows a snackbar. All parameters required.
  static void showSnackbar(BuildContext context,
      {required String title, required String details}) {
    Get.snackbar(title, details,
        colorText: CupertinoTheme.of(context).textTheme.textStyle.color);
  }

  /// Shows a snackbar with error details.
  /// Works only with [AppError] class.
  static void showError(AppError e, BuildContext context) {
    showSnackbar(context,
        title: e.errorDetails == null ? 'Ocorreu um erro' : e.errorTitle,
        details: e.errorDetails ?? e.errorTitle);
  }
}
