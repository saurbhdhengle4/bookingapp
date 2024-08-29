import 'package:bookingdemoapp/app/data/colors.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double size = screenWidth * 0.22;
    String src = 'https://picsum.photos/200/300';
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: UIC.pinkDark, width: 1.5),
      ),
      child: ClipOval(
        child: Image.network(src, fit: BoxFit.cover),
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Emily Cyrus",
      style:
          TextStyle(color: UIC.pinkDark, fontWeight: FontWeight.w800, fontSize: 22),
    );
  }
}
