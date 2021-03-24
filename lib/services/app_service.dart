import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sync_play/ui/pages/auth/auth_bloc.dart';
import 'package:sync_play/ui/pages/home/home_bindings.dart';
import 'package:sync_play/ui/pages/register/register_bloc.dart';

class AppService extends GetxService {
  final key = GlobalKey<NavigatorState>();
  static const defaultProfilePic =
      'https://firebasestorage.googleapis.com/v0/b/sync-play-46e93.appspot.com/o/default_assets%2FProfile-PNG-Icon.png?alt=media&token=d2f7dcaf-6709-4ea9-84a4-cf806c4edbc7';
  void _loadInitialBindings() {
    HomePageBindings.dependencies();
    RegisterPageBindings.dependencies();
    AuthBindings.dependencies();
  }

  @override
  void onReady() {
    _loadInitialBindings();
    super.onReady();
  }
}
