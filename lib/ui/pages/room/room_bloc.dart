import 'package:get/get.dart';
import 'package:sync_play/models/app_binding.dart';
import 'package:sync_play/util/single_instance_function.dart';
import 'package:video_player/video_player.dart';

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
  final videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
  late SingleInstanceFunction _updateSeekUiSingle;
  @override
  void onInit() {
    _updateSeekUiSingle = SingleInstanceFunction(_updateSeekUi);
    _initializePlayer();
    videoPlayerController.addListener(() => _updateSeekUiSingle());
    super.onInit();
  }

  Future<void> _initializePlayer() async {
    await videoPlayerController.initialize();
    update();
  }

  Future<void> _updateSeekUi() async {
    totalDuration = videoPlayerController.value.duration;
    var _currPos = (await videoPlayerController.position ?? currentPosition);
    if (_currPos.isNegative) {
      _currPos = Duration.zero;
    }
    currentPosition = _currPos >= totalDuration ? totalDuration : _currPos;

    if (currentPosition >= totalDuration) {
      print('player is finished');
      await videoPlayerController.pause();
      await videoPlayerController.seekTo(Duration.zero);
      await videoPlayerController.initialize();
    }
    update();
  }

  Future<void> handlePlay() async {
    videoPlayerController.value.isPlaying
        ? await videoPlayerController.pause()
        : await videoPlayerController.play();
    update();
  }
}
