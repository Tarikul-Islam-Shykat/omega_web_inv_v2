import 'package:get/get.dart';
import 'package:video_player/video_player.dart';


class VideoController extends GetxController{
  late VideoPlayerController videoController;
  RxBool isInitialize = false.obs;
  RxBool isPlaying = false.obs;

   initializeVideo(String videoUrl){
    videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
    ..initialize().then((_){
      isInitialize.value = true;
      update();
    });
  }

  void onPlayPush(){
    if(videoController.value.isPlaying){
      videoController.pause();
      isPlaying.value = false;
    }else{
      videoController.play();
      isPlaying.value = true;
    }
  }
  @override
  void onInit() {
    super.onInit();
    videoController.value;
  }

  @override
  void onClose() {
    super.onClose();
    videoController.dispose();
    super.onClose();
  }
}