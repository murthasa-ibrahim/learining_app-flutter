import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class ResultviewController extends GetxController{
  final confiController = ConfettiController();
  bool isPlaying = false;

  @override
  void onInit() {
    confiController.play();
    super.onInit();
  }
  
}