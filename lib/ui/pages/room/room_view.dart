import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/ui/pages/room/components/chat_builder.dart';
import 'package:video_player/video_player.dart';

import 'room_bloc.dart';

class RoomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Sala'),
      ),
      child: GetBuilder<RoomController>(
        builder: (controller) {
          return Column(
            children: [
              AspectRatio(
                aspectRatio:
                    controller.videoPlayerController.value.isInitialized
                        ? controller.videoPlayerController.value.aspectRatio
                        : 16 / 9,
                child: controller.videoPlayerController.value.isInitialized
                    ? VideoPlayer(controller.videoPlayerController)
                    : Container(
                        color: Colors.black,
                      ),
              ),
              CupertinoButton(
                onPressed: controller.handlePlay,
                child: Icon(controller.videoPlayerController.value.isPlaying
                    ? CupertinoIcons.pause
                    : CupertinoIcons.play),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(formatDuration(controller.currentPosition)),
                  CupertinoSlider(
                    value: controller.currentPosition.inMilliseconds.toDouble(),
                    onChanged: null,
                    max: controller.totalDuration.inMilliseconds.toDouble(),
                  ),
                  Text(formatDuration(controller.totalDuration)),
                ],
              ),
              Expanded(child: ChatBuilder()),
            ],
          );
        },
      ),
    );
  }

  String formatDuration(Duration _duration) {
    final _min = _duration.inMinutes.toString();
    final _sec = (_duration.inSeconds - (_duration.inMinutes * 60)).toString();
    return '${_min.length == 1 ? '0' + _min : _min}'
        ':'
        '${_sec.length == 1 ? '0' + _sec : _sec}';
  }
}
