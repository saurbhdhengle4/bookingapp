import 'package:bookingdemoapp/app/data/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookingdemoapp/app/modules/home/controllers/home_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final HomeController controller;

  const CustomBottomNavigationBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 67,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.selectedIndex.value,
              onTap: (index) => controller.changeIndex(index),
              selectedItemColor: UIC.pinkDark,
              unselectedItemColor: UIC.textColorDark,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.percent),
                  label: 'Package',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.schedule),
                  label: 'Booking',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: (MediaQuery.of(context).size.width / 4) *
                      controller.selectedIndex.value +
                  MediaQuery.of(context).size.width / 8 - 4,
                  
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: UIC.pinkDark,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
