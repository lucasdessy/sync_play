import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sync_play/services/app_service.dart';
import 'package:sync_play/services/auth_service.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/components/logout_sheet.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/components/profile_edit_view.dart';

class ProfileTabController extends GetxController {
  final _authService = Get.find<AuthService>();
  String? get userName => _authService.currentUser()?.name;
  String? get userEmail => _authService.authUser()?.email;
  String get userPic =>
      _authService.currentUser()?.profilePicUrl ?? AppService.defaultProfilePic;
  bool get loading => _authService.loading() ?? false;
  void handleGoToEdit(BuildContext context) {
    showCupertinoModalBottomSheet(
        context: context,
        builder: (context) => ProfileEditView(
              controller: this,
            ));
  }

  Future<void> handleLogout(BuildContext context) async {
    if (loading) {
      return;
    }
    final willLogout = await showCupertinoModalPopup<bool?>(
        context: context, builder: (ctx) => LogoutSheet());
    if (willLogout ?? false) {
      await _authService.logout();
    }
  }

  // TODO make auth service save profile and update Rx variables
  Future<void> handleSaveProfile(BuildContext context) async {
    _authService.setLoading(true);
    await Future.delayed(Duration(seconds: 3));
    _authService.setLoading(false);
    Navigator.of(context).pop();
  }
}
