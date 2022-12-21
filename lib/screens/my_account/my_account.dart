import 'package:flutter/material.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      body: SafeArea(child: Center(
        child: Text('My Account'),
      )),
     );
  }
}