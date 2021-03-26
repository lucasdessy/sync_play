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
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
      // 'https://r2---sn-hpbvuxaxjvcg-5g0e.googlevideo.com/videoplayback?expire=1616799955&ei=cxReYLDYKbzT1sQPq6662A8&ip=138.59.33.191&id=o-APU6UCy3cgtDqnAOG9R__sKD73HoThw5zxcAcd7TNSUa&itag=303&aitags=133%2C134%2C135%2C136%2C160%2C242%2C243%2C244%2C247%2C278%2C298%2C299%2C302%2C303&source=youtube&requiressl=yes&mh=eb&mm=31%2C29&mn=sn-hpbvuxaxjvcg-5g0e%2Csn-pmcg-bg0e&ms=au%2Crdu&mv=m&mvi=2&pcm2cms=yes&pl=24&initcwndbps=825000&vprv=1&mime=video%2Fwebm&ns=JkG_WN2mk4mRxstHXz-y5jkF&gir=yes&clen=17376457&dur=40.999&lmt=1616776286064729&mt=1616778046&fvip=3&keepalive=yes&fexp=24001373%2C24007246&beids=23886216&c=WEB&txp=5432434&n=hCUXPL4ScZNG_t1Awj556&sparams=expire%2Cei%2Cip%2Cid%2Caitags%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRQIgPzKUFLext6xSqqchmnrGl74R5fm75UwEfbws1Ej6SxMCIQCoV1P-GpG4fPESk4uTfBBWXc0w1Y6GCA0i3YON9sZN8Q%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpcm2cms%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhAN9wV6rhe4-jIZaxU8HQSSfydePe4CxCJMiD98meEpxgAiAoxvsAs3j1cW-UN9x16yo1GBg5dfS1q3jotK0EjHFkSA%3D%3D'
      ,
      formatHint: VideoFormat.dash);
  late SingleInstanceFunction _updateSeekUiSingle;
  bool get showButtons => !videoPlayerController.value.isPlaying;
  @override
  void onInit() {
    _updateSeekUiSingle = SingleInstanceFunction(_updateSeekUi);
    // _initializePlayer();
    super.onInit();
  }

  Future<void> _initializePlayer() async {
    await videoPlayerController.initialize();
    videoPlayerController.addListener(() => _updateSeekUiSingle());
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
