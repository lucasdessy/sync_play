import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sync_play/models/app_error.dart';
import 'package:sync_play/services/auth_service.dart';
import 'package:sync_play/ui/pages/auth/auth_bloc.dart';
import 'package:sync_play/ui/pages/home/home_bindings.dart';
import 'package:sync_play/ui/pages/register/register_bloc.dart';
import 'package:uuid/uuid.dart';

class AppService extends GetxService {
  static const defaultProfilePic =
      'https://firebasestorage.googleapis.com/v0/b/sync-play-46e93.appspot.com/o/default_assets%2FProfile-PNG-Icon.png?alt=media&token=d2f7dcaf-6709-4ea9-84a4-cf806c4edbc7';
  final key = GlobalKey<NavigatorState>();
  final _picker = ImagePicker();
  final _storage = FirebaseStorage.instance;
  final RxBool loading = false.obs;
  late final AuthService _authService;
  final uuid = Uuid();

  void _loadInitialBindings() {
    HomePageBindings.dependencies();
    RegisterPageBindings.dependencies();
    AuthBindings.dependencies();
  }

  @override
  void onReady() {
    _loadInitialBindings();
    _authService = Get.find<AuthService>();
    super.onReady();
  }

  void setLoading(bool v) {
    loading.value = v;
  }

  Future<File?> getImageFile(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    if (pickedFile == null) {
      return null;
    }
    return File(pickedFile.path);
  }

  Future<String> uploadFile(File file) async {
    try {
      setLoading(true);
      final task =
          _storage.ref('users/${_authService.authUser()?.uid}/${uuid.v4()}');
      await task.putFile(file);
      return task.getDownloadURL();
    } catch (e) {
      throw AppError('Ocorreu um erro interno',
          errorDetails: 'Não foi possível fazer upload da imagem');
    } finally {
      setLoading(false);
    }
  }

  Future<File?> cropImage(File imageFile) async {
    return ImageCropper.cropImage(
      sourcePath: imageFile.path,
      cropStyle: CropStyle.circle,
      compressQuality: 80,
      compressFormat: ImageCompressFormat.jpg,
    );
  }
}
