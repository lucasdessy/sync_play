import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/app.dart';
import 'package:sync_play/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeServices();
  runApp(App());
}

void initializeServices() {
  Get.put(AuthService());
}
