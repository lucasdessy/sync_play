import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sync_play/models/chat_message.dart';
import 'package:sync_play/ui/components/default_padding.dart';
import 'package:sync_play/ui/components/list_tile_spacer.dart';
import 'package:sync_play/ui/pages/room/components/chat_bubble.dart';

class ChatBuilder extends StatelessWidget {
  final teste = List<ChatMessage>.generate(
    20,
    (index) => ChatMessage(
      roomId: '1234',
      content: Random().nextBool() ? 'Poggers rafis' : 'KURWA',
      isSender: index.isEven,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 70, top: 0),
            child: ListView.separated(
              itemCount: teste.length,
              itemBuilder: (context, index) {
                final message = teste[index];
                return ChatBubble(message: message);
              },
              separatorBuilder: (ctx, idx) => ListTileSpacer(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: DefaultPadding(
            child: CupertinoTextField(
              padding: EdgeInsets.zero,
              suffix: CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: Icon(
                  CupertinoIcons.arrow_up_circle_fill,
                  color: CupertinoColors.activeGreen.resolveFrom(context),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
