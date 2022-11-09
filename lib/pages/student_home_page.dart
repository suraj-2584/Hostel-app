import 'package:flutter/material.dart';
import 'login_page.dart';
import '../out_pass.dart';
import '../mess_fee.dart';
import '../status.dart';

class StudentHomePage extends StatefulWidget {
  final String userName;
  static const routeName = "StudentHomePage";
  StudentHomePage(this.userName);

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int selectedIndex = 0;
  Widget currentSelected() {
    if (selectedIndex == 0) {
      return OutPass(widget.userName);
    } else if (selectedIndex == 1) {
      return Status(widget.userName);
    } else {
      return MessFee(widget.userName);
    }
  }

  Map<int, String> pageName = {
    0: "Out Pass",
    1: "Approval Status",
    2: "Mess Fee Payment"
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(pageName[selectedIndex] as String),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
              child: Text(
                "Pages",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Out Pass'),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.request_page_outlined),
              title: const Text('Request Status'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.restaurant),
              title: const Text('Mess Fee'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Logged out"),
                  ),
                );
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginPage("student"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: currentSelected(),
    );
  }
}
