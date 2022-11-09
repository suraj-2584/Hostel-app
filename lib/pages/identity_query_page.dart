import 'package:flutter/material.dart';
import 'login_page.dart';
import '/models/identity_card.dart';

class IdentityQuery extends StatelessWidget {
  const IdentityQuery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 40),
            const Text(
              "Select your identity ",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 30,
              ),
            ),
            // SizedBox(height: 50),
            GestureDetector(
              child: IdentityCard("Student"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage("Student"),
                  ),
                );
              },
            ),
            // SizedBox(height: 30),
            InkWell(
              child: IdentityCard("Admin"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage("Admin"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
