import 'package:flutter/material.dart';

class ReferAFriendView extends StatelessWidget {
  const ReferAFriendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      body: SafeArea(child: Center(
        child: Text('Refer a friend'),
      )),
     );
  }
}