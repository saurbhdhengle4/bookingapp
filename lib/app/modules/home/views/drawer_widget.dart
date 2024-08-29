import 'package:bookingdemoapp/app/data/colors.dart';
import 'package:bookingdemoapp/app/modules/home/views/profile_image.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTileTheme(
        textColor: UIC.pink,
        iconColor: UIC.pink,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 20),
            const ProfilePicture(),
            const SizedBox(height: 10),
            const UserName(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tab(onTap: () {}, label: 'Home'),
                  dividerWidget(),
                  tab(onTap: () {}, label: 'Book A Nanny'),
                  dividerWidget(),
                  tab(onTap: () {}, label: 'How It Work'),
                  dividerWidget(),
                  tab(onTap: () {}, label: 'Why Nanny Vanny'),
                  dividerWidget(),
                  tab(onTap: () {}, label: 'My Booking'),
                  dividerWidget(),
                  tab(onTap: () {}, label: 'My Profile'),
                  dividerWidget(),
                  tab(onTap: () {}, label: 'Support'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Divider dividerWidget() => Divider(color: UIC.pinkDark, thickness: 0.5);

  tab({required Function() onTap, required String label}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
            color: UIC.buttonColor, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class DrawerDecoration extends StatelessWidget {
  const DrawerDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.white.withOpacity(0.2)],
        ),
      ),
    );
  }
}

BoxDecoration childDecoration() {
  return BoxDecoration(
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],
    borderRadius: const BorderRadius.all(Radius.circular(16)),
  );
}
