import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';
import 'package:sync_play/services/auth_service.dart';
import 'package:sync_play/services/route_service.dart';

class App extends StatelessWidget {
  final authService = Get.find<AuthService>();
  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'Sync Play',
      getPages: RouteService.getPages,
      initialRoute: (authService.isLoggedin() ?? false)
          ? RouteService.HOME
          : RouteService.AUTH,
    );
  }
}
