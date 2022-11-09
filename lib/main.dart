import 'package:flutter/material.dart';
import 'pages/identity_query_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      title: 'Hostel App',
      home: const IdentityQuery(),
    );
  }
}
