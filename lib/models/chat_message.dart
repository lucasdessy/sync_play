import 'package:sync_play/models/fire_user.dart';

class ChatMessage {
  String? content;
  late String roomId;
  FireUser? user;
  late bool isSender;
  ChatMessage(
      {this.content, this.user, this.isSender = false, required this.roomId}) {
    user ??= FireUser(name: 'Erro');
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'content': content,
        'user': user?.toJson() ?? FireUser(name: 'Erro').toJson(),
        'roomId': roomId,
      };

  ChatMessage.fromJson(Map<String, dynamic>? snapshot) {
    isSender = false;
    roomId = snapshot?['roomId'];
    content = snapshot?['content'];
    user = FireUser.fromJson(snapshot?['user']);
  }
}
