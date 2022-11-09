import 'package:flutter/material.dart';

class OutPass extends StatelessWidget {
  final String userName;

  const OutPass(this.userName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("outpass"),
      ),
    );
  }
}
