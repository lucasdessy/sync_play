import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';
import 'package:sync_play/services/route_service.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'Sync Play',
      getPages: RouteService.getPages,
      initialRoute: RouteService.SPLASH,
    );
  }
}
