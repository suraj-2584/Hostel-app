import 'package:flutter/material.dart';

class MessFee extends StatelessWidget {
  final String userName;

  const MessFee(this.userName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("mess fee"),
      ),
    );
  }
}
