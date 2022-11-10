import 'package:flutter/material.dart';
import 'login_page.dart';
import '../out_pass.dart';
import '../mess_fee.dart';
import '../status.dart';
import 'view_menu.dart';

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
    } else if (selectedIndex == 2) {
      return MessFee(widget.userName);
    } else {
      return ViewMenu();
    }
  }

  Map<int, String> pageName = {
    0: "Out Pass",
    1: "Approval Status",
    2: "Mess Fee Payment",
    3: "Mess Menu"
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: ListTile(
          title: Text(
            pageName[selectedIndex] as String,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.person,
              size: 30,
              //color: Colors.grey,
            ),
            onPressed: () {},
          ),
        ),
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
              title: const Text('Out pass'),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.request_page_outlined),
              title: const Text('Request status'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: const Text('Pay mess fee'),
              onTap: () {
                Navigator.pop(context);
                setState(
                  () {
                    selectedIndex = 2;
                  },
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.restaurant),
              title: const Text('View today\'s menu'),
              onTap: () {
                Navigator.pop(context);
                setState(
                  () {
                    selectedIndex = 3;
                  },
                );
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
                    builder: (context) => LoginPage("Student"),
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
