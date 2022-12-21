import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/const/constant.dart';
import 'package:learning_app/screens/navbar/controller/navbar_contrller.dart';

class Navbar extends GetView {
  Navbar({Key? key}) : super(key: key);

  final navbarController = Get.put(NavbarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavbarController>(
        builder: (controller) => (controller.screens[controller.screenIndex]),
      ),
      bottomNavigationBar: GetBuilder<NavbarController>(
        builder: (controller) => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              backgroundColor: kblack,
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.post_add_rounded), label: 'Refer a friend'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                ),
                label: 'Find a course'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'My account'),
          ],
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: kwhight,
          unselectedItemColor: Colors.grey,
          currentIndex: controller.screenIndex,
          onTap: (index) {
            controller.changeIndex(index);
          },
        ),
      ),
    );
  }
}
