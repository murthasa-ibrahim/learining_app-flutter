import 'package:flutter/material.dart';

class FindACourseView extends StatelessWidget {
  const FindACourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      body: SafeArea(child: Center(
        child: Text('Find A Course'),
      )),
     );
  }
}