import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/screens/splash/controller/splash_controller.dart';

class SplashView extends GetView {
  const SplashView({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    Get.put(SplahController(context: context));
    return const Scaffold(
      body: Center(
           child: Text('Learning App'),
      ),
    );
  }
}