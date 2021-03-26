import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sync_play/ui/components/default_padding.dart';
import 'package:sync_play/ui/pages/room/room_bloc.dart';
import 'package:video_player/video_player.dart';

class Player extends StatelessWidget {
  final RoomController controller;

  const Player({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final player = controller.videoPlayerController;
    if (player == null) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.black,
          child: Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          )),
        ),
      );
    }
    return GestureDetector(
      onTap: controller.handlePlayerTap,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: player.value.isInitialized
                  ? VideoPlayer(player)
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
                        child: IgnorePointer(
                          ignoring: !controller.showButtons,
                          child: CupertinoButton(
                            onPressed: controller.handlePlay,
                            child: Icon(
                              player.value.isPlaying
                                  ? CupertinoIcons.pause
                                  : CupertinoIcons.play,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: DefaultPadding(
                        top: 0,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatDuration(controller.currentPosition),
                              style: TextStyle(color: Colors.white),
                            ),
                            IgnorePointer(
                              ignoring: !controller.showButtons,
                              child: CupertinoSlider(
                                // value: controller.currentPosition.inMilliseconds
                                //     .toDouble(),
                                value: controller.dCurrentPosition() ?? 0,
                                onChanged: controller.changePosition,
                                onChangeEnd: controller.seekTo,
                                max: controller.totalDuration.inMilliseconds
                                    .toDouble(),
                              ),
                            ),
                            Text(
                              formatDuration(controller.totalDuration),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
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
