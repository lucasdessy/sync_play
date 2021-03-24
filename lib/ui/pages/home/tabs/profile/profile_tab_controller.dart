import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sync_play/services/auth_service.dart';

class ProfileTabController extends GetxController {
  final _authService = Get.find<AuthService>();
  String? get userName => _authService.currentUser()!.name;
  String? get userEmail => _authService.authUser()!.email;
  String get userPic => _authService.currentUser()!.profilePicUrl;
}
