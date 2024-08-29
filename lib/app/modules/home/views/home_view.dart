import 'package:bookingdemoapp/app/data/colors.dart';
import 'package:bookingdemoapp/app/modules/home/controllers/data_controller.dart';
import 'package:bookingdemoapp/app/modules/home/views/booking_view.dart';
import 'package:bookingdemoapp/app/modules/home/views/bottom_sheet_widget.dart';
import 'package:bookingdemoapp/app/modules/home/views/common_widget.dart';
import 'package:bookingdemoapp/app/modules/home/views/drawer_widget.dart';
import 'package:bookingdemoapp/app/modules/home/views/package_view.dart';
import 'package:bookingdemoapp/app/modules/home/views/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: const DrawerDecoration(),
      openRatio: 0.60,
      controller: controller.advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: childDecoration(),
      drawer: const DrawerWidget(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [draweericonWidget()],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(controller: controller),
        body: Obx(
          () => ModalProgressHUD(
              color: Colors.white,
              inAsyncCall: Get.find<DataController>().isPageLoading.value,
              progressIndicator: CircularProgressIndicator(color: UIC.pinkDark),
              child: ListView(
                shrinkWrap: true,
                children: [
                  profileView(),
                  addBookNowCard(context),
                  VisibilityTextWidget(
                    isVisible:
                        Get.find<DataController>().bookingList.isNotEmpty,
                    text: 'Your Current Booking',
                  ),
                  const BookingView(),
                  VisibilityTextWidget(
                    isVisible:
                        Get.find<DataController>().packageList.isNotEmpty,
                    text: 'Package',
                  ),
                  const PackageView()
                ],
              )),
        ),
      ),
    );
  }

  Padding profileView() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          const ProfilePicture(),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                    color: UIC.textColorDark,
                    fontWeight: FontWeight.w800,
                    fontSize: 19),
              ),
              const UserName(),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox addBookNowCard(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 30),
              padding: const EdgeInsets.only(left: 20, right: 50),
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: UIC.pink, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nanny And \nBabysitting Service",
                      style: TextStyle(
                          fontSize: 16,
                          color: UIC.buttonColor,
                          fontFamily: "regular",
                          fontWeight: FontWeight.w800)),
                  const SizedBox(height: 10),
                  ButtonWidget(text: 'Book Now', onTap: () {}, width: 0.3)
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  "assets/preview.png",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  draweericonWidget() {
    return IconButton(
      padding: const EdgeInsets.only(left: 20, right: 20),
      onPressed: controller.handleMenuButtonPressed,
      icon: ValueListenableBuilder<AdvancedDrawerValue>(
        valueListenable: controller.advancedDrawerController,
        builder: (_, value, __) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Icon(
              value.visible ? Icons.segment : Icons.segment,
              color: UIC.pinkDark,
              size: 35,
              key: ValueKey<bool>(value.visible),
            ),
          );
        },
      ),
    );
  }
}
