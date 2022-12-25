import 'dart:developer';

import 'package:get/get.dart';
import 'package:learning_app/utils/utils.dart';

class MyAccountController extends GetxController {

  void logout()async{
   await Utils.storage.deleteAll();
   log('log out');
  }
}