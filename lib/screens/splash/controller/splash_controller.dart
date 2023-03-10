import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:learning_app/screens/auth/Login/view/login_view.dart';
import 'package:learning_app/screens/navbar/view/navbar.dart';
import 'package:learning_app/utils/utils.dart';
import 'package:overlay_support/overlay_support.dart';

class SplahController extends GetxController {
  SplahController({required this.context});
  late BuildContext context;
  bool tokenValid = false;
  @override
  void onInit() {
    super.onInit();
    checkToken();
    checkConnection();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => tokenValid ? Navbar() : LoginView(),
        ),
      ),
    );
  }

  Future<void> checkToken() async {
    Utils.getToken().then(
      (value) {
        if (value != null) {
          tokenValid = true;
          update();
        }
      },
    );
  }

  void checkConnection() {
    InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInterenet = event == InternetConnectionStatus.connected;
      // hasInterrn.value = hasInterenttt;
      // hasInterenttt;h
      Utils.hasInternet = hasInterenet;
      update();
      if (!hasInterenet) {
        showSimpleNotification(const Text('no network'),
            background: Colors.red);
      }
      update();
    });
  }
}
