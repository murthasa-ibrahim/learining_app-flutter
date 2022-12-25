import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_app/screens/dashbord/view/dashbord_view.dart';
import 'package:learning_app/screens/find_a_course/find_a_course.dart';
import 'package:learning_app/screens/my_account/view/my_account.dart';
import 'package:learning_app/screens/refer_friend/refer_a_friend_view.dart';

class NavbarController extends GetxController{
   
    int screenIndex = 0;
    List<Widget> screens = [
    const DashBordView(),
    const ReferAFriendView(),
    const FindACourseView(),
    const MyAccountView(),
  ];
  changeIndex(int index){
      screenIndex = index;
      update();
    }

    bool alertCheck = true;
    
}