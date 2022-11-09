import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  final String userName;

  const Status(this.userName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("status"),
      ),
    );
  }
}
