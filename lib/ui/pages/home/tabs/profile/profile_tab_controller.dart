import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sync_play/models/app_error.dart';
import 'package:sync_play/services/app_service.dart';
import 'package:sync_play/services/user_service.dart';
import 'package:sync_play/services/route_service.dart';
import 'package:sync_play/ui/pages/history/history_bloc.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/components/choose_profile_picture_sheet.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/components/discard_edit_sheet.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/components/logout_sheet.dart';
import 'package:sync_play/ui/pages/home/tabs/profile/components/profile_edit_view.dart';
import 'package:sync_play/util/util.dart';

class ProfileTabController extends GetxController {
  final _userService = Get.find<UserService>();
  final _appService = Get.find<AppService>();
  String get userName => _userService.currentUser()?.name ?? 'Sem nome';
  String get userEmail => _userService.authUser()?.email ?? 'Sem email';
  String get userPic =>
      _userService.currentUser()?.profilePicUrl ?? AppService.defaultProfilePic;
  bool get loading => (_userService.loading()) || (_appService.loading());

  final nameController = TextEditingController();

  void handleGoToEdit(BuildContext context) {
    nameController.text = userName;
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => ProfileEditView(
        controller: this,
      ),
      animationCurve: Curves.easeInOutCirc,
      duration: Duration(milliseconds: 400),
      enableDrag: true,
      bounce: true,
    );
  }

  Future<void> handleGoToHistoryPage(BuildContext context) async {
    HistoryPageBindings().dependencies();
    await Navigator.of(context).pushNamed(RouteService.HISTORY);
    HistoryPageBindings().destroy();
  }

  Future<void> handleLogout(BuildContext context) async {
    if (loading) {
      return;
    }
    final willLogout = await showCupertinoModalPopup<bool?>(
        context: context, builder: (ctx) => LogoutSheet());
    if (willLogout ?? false) {
      await _userService.logout();
    }
  }

  Future<void> handleSaveProfile(BuildContext context) async {
    try {
      if (nameController.text != userName) {
        await _userService.updateUser(name: nameController.text);
      }
      Navigator.of(context).pop();
    } on AppError catch (e) {
      Util.showError(e, context);
    }
  }

  Future<bool> profileEditViewOnWillPop(BuildContext context) async {
    if (nameController.text != userName) {
      final discardChanges = await showCupertinoModalPopup<bool?>(
          context: context, builder: (ctx) => DiscardEditSheet());
      return (discardChanges ?? false);
    }
    return true;
  }

  Future<void> handleChangeProfilePicture(BuildContext context) async {
    try {
      final source = await showCupertinoModalPopup<ImageSource?>(
          context: context, builder: (ctx) => ChooseProfilePictureSheet());
      if (source != null) {
        final file = await _appService.getImageFile(source);
        if (file != null) {
          final croppedFile = await _appService.cropImage(file);
          if (croppedFile != null) {
            final pfpUrl = await _appService.uploadFile(croppedFile);
            await _userService.updateUser(profilePicUrl: pfpUrl);
          }
        }
      }
    } on AppError catch (e) {
      Util.showError(e, context);
    }
  }
}
