// Sim, nome estranho, só para difernciar o user do Auth
// com o user do firestore

import 'package:sync_play/services/app_service.dart';

class FireUser {
  // String? id;
  String? name;
  late String profilePicUrl;
  String? token;

  FireUser({this.name, this.profilePicUrl = AppService.defaultProfilePic});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'profilePicUrl': profilePicUrl,
        'token': token,
      };

  FireUser.fromJson(Map<String, dynamic>? snapshot) {
    name = snapshot?['name'];
    profilePicUrl = snapshot?['profilePicUrl'] ?? AppService.defaultProfilePic;
    token = snapshot?['token'];
  }
}
