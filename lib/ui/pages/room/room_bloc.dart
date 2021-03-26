import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_play/models/app_binding.dart';
import 'package:sync_play/ui/pages/room/components/resolutions_sheet.dart';
import 'package:sync_play/util/single_instance_function.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class RoomBindings implements AppBinding {
  @override
  void dependencies() {
    Get.put(RoomController());
  }

  @override
  void destroy() {
    Get.delete<RoomController>();
  }
}

class RoomController extends GetxController {
  Duration totalDuration = Duration(minutes: 1);
  Duration currentPosition = Duration.zero;

  final dCurrentPosition = 0.0.obs;

  final yt = YoutubeExplode();
  VideoPlayerController? videoPlayerController;

  late SingleInstanceFunction _updateSeekUiSingle;
  List<MuxedStreamInfo>? resolutions;
  bool get showButtons =>
      !(videoPlayerController?.value.isPlaying ?? false) || _showButtons;
  var _showButtons = false;
  var _goingToSeek = false;
  @override
  void onInit() {
    _updateSeekUiSingle = SingleInstanceFunction(_updateSeekUi);
    _initializePlayer();
    super.onInit();
  }

  void seekTo(double v) async {
    if (_goingToSeek) {
      return;
    }
    _goingToSeek = true;
    print('seekTO?');
    await videoPlayerController?.pause();
    await videoPlayerController?.seekTo(Duration(milliseconds: v.toInt()));
    await videoPlayerController?.play();
    _goingToSeek = false;
  }

  Future<void> _initializePlayer([MuxedStreamInfo? info]) async {
    late String _url;
    if (info == null) {
      final manifest = await yt.videos.streamsClient
          .getManifest('https://www.youtube.com/watch?v=IjeHpNJfZpc');
      resolutions = manifest.muxed.toList();
      _url = manifest.muxed.withHighestBitrate().url.toString();
    } else {
      _url = info.url.toString();
    }
    videoPlayerController = VideoPlayerController.network(_url);
    await videoPlayerController!.initialize();
    videoPlayerController!.addListener(() => _updateSeekUiSingle());
    update(['player']);
  }

  Future<void> _updateSeekUi() async {
    totalDuration = videoPlayerController!.value.duration;
    var _currPos = (await videoPlayerController!.position ?? currentPosition);
    if (_currPos.isNegative) {
      _currPos = Duration.zero;
    }
    currentPosition = _currPos >= totalDuration ? totalDuration : _currPos;
    if (!_goingToSeek) {
      dCurrentPosition.value = currentPosition.inMilliseconds.toDouble();
    }

    if (currentPosition >= totalDuration) {
      print('player is finished');
      await videoPlayerController!.pause();
      await videoPlayerController!.seekTo(Duration.zero);

      // await videoPlayerController!.initialize();
    }
    update(['player']);
  }

  Future<void> handlePlay() async {
    print('handle play?');
    videoPlayerController!.value.isPlaying
        ? await videoPlayerController!.pause()
        : await videoPlayerController!.play();
    update(['player']);
  }

  void changePosition(double v) {
    dCurrentPosition.value = v;
    update(['player']);
    if (!videoPlayerController!.value.isPlaying) {
      return;
    }
    handlePlay();
  }

  Future<void> disposeControllers() async {
    print('disposing controller...');
    await videoPlayerController?.dispose();
  }

  Future<void> handlePlayerTap() async {
    if (showButtons) {
      return;
    }
    print('player toggle');
    _showButtons = true;
    update(['player']);
    await Future.delayed(Duration(seconds: 2));
    _showButtons = false;
    update(['player']);
  }

  Future<void> changeResolution(BuildContext context) async {
    if (resolutions != null) {
      final result = await showCupertinoModalPopup<MuxedStreamInfo?>(
        context: context,
        builder: (ctx) => ResolutionsSheet(resolutions: resolutions!),
      );
      if (result != null) {
        if (result is MuxedStreamInfo) {
          return _initializePlayer(result);
        }
      }
    }
  }
}
