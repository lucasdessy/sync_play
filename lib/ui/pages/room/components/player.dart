import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sync_play/ui/pages/room/room_bloc.dart';
import 'package:video_player/video_player.dart';

class Player extends StatelessWidget {
  final RoomController controller;

  const Player({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.videoPlayerController.value.isInitialized
          ? controller.videoPlayerController.value.aspectRatio
          : 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AspectRatio(
            aspectRatio: controller.videoPlayerController.value.isInitialized
                ? controller.videoPlayerController.value.aspectRatio
                : 16 / 9,
            child: controller.videoPlayerController.value.isInitialized
                ? VideoPlayer(controller.videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          AnimatedOpacity(
            opacity: controller.showButtons ? 1 : 0,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ], stops: [
                  0,
                  0.3,
                  0.6,
                  1
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.5)),
                      child: CupertinoButton(
                        onPressed: controller.handlePlay,
                        child: Icon(
                          controller.videoPlayerController.value.isPlaying
                              ? CupertinoIcons.pause
                              : CupertinoIcons.play,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          formatDuration(controller.currentPosition),
                          style: TextStyle(color: Colors.white),
                        ),
                        CupertinoSlider(
                          value: controller.currentPosition.inMilliseconds
                              .toDouble(),
                          onChanged: null,
                          max: controller.totalDuration.inMilliseconds
                              .toDouble(),
                        ),
                        Text(
                          formatDuration(controller.totalDuration),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
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
