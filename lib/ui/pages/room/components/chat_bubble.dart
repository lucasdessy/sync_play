import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sync_play/models/chat_message.dart';
import 'package:sync_play/services/app_service.dart';
import 'package:sync_play/ui/components/default_padding.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({Key? key, required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (message.content == null) {
      return Container();
    }
    return DefaultPadding(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (message.isSender) _buildText(message.content!),
          Expanded(
            child: Align(
              alignment: message.isSender
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: CircleAvatar(
                radius: 20,
                backgroundColor:
                    CupertinoColors.systemFill.resolveFrom(context),
                backgroundImage: NetworkImage(message.user?.profilePicUrl ??
                    AppService.defaultProfilePic),
              ),
            ),
          ),
          if (!message.isSender) _buildText(message.content!),
        ],
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(text);
  }
}
