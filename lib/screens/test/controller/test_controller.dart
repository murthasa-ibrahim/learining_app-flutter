

import 'package:get/get.dart';

class TestController extends GetxController{

  // RxBool isVisible = false.obs;

  bool checkVisibilty(dynamic userTest,int index){

    if(userTest == null && index !=0){
 
      return true;
    }
    return false;
  }
}