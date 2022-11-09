import 'package:flutter/material.dart';

class IdentityCard extends StatelessWidget {
  final String userType;
  const IdentityCard(this.userType, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .35,
      width: size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            userType == "Student"
                ? "https://www.pngitem.com/pimgs/m/235-2350916_student-netid-login-transparent-background-student-icon-hd.png"
                : "https://www.pngitem.com/pimgs/m/32-327107_png-format-images-of-teacher-icons-teacher-icon.png",
          ),
        ),
      ),
    );
  }
}
