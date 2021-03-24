import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/services/app_service.dart';

import 'package:sync_play/services/route_service.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool authLoaded = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Sync Play',
      initialRoute: RouteService.SPLASH,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteService.onGenerateRoute,
      navigatorKey: Get.find<AppService>().key,
    );
  }
}
