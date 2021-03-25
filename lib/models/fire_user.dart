// Sim, nome estranho, só para difernciar o user do Auth
// com o user do firestore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sync_play/services/app_service.dart';

class FireUser {
  String? id;
  String? name;
  late String profilePicUrl;
  String? token;

  FireUser({this.name, this.profilePicUrl = AppService.defaultProfilePic});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'profilePicUrl': profilePicUrl,
        'token': token,
      };

  FireUser.fromDocument(DocumentSnapshot snapshot) {
    name = snapshot.data()?['name'];
    profilePicUrl = snapshot.data()?['profilePicUrl'];
    token = snapshot.data()?['token'];
  }
}
