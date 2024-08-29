import 'dart:math';

import 'package:bookingdemoapp/app/data/colors.dart';
import 'package:bookingdemoapp/app/data/package_list_model.dart';
import 'package:bookingdemoapp/app/modules/home/controllers/data_controller.dart';
import 'package:bookingdemoapp/app/modules/home/views/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageView extends StatelessWidget {
  const PackageView({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return Obx(
      () => ListView.builder(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: Get.find<DataController>().packageList.length,
        itemBuilder: (context, index) {
          PackageList item = Get.find<DataController>().packageList[index];
          final isEven = index % 2 == 0;
          final containerColor = isEven ? UIC.pink : UIC.indigo;
          final iconColor = isEven ? UIC.pinkDark : Colors.white;
          final bookNowColor = isEven ? UIC.pinkDark : UIC.darkIndigo;
          final descColor = isEven ? Colors.black45 : Colors.white;
          IconData randomIcon =
              calendarIcons[random.nextInt(calendarIcons.length)];

          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      randomIcon,
                      color: iconColor,
                      size: 50,
                    ),
                    ButtonWidget(
                      text: "Book Now",
                      width: 0.25,
                      color: bookNowColor,
                    )
                  ],
                ),
                c5(),
                c5(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.title ?? "",
                      style: TextStyle(
                          fontSize: 19,
                          color: UIC.buttonColor,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "₹ ${item.price}",
                      style: TextStyle(
                          fontSize: 19,
                          color: UIC.buttonColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                c5(),
                Text(
                  item.desc ?? "",
                  style:
                      TextStyle(color: descColor, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox c5() => const SizedBox(height: 5);
  SizedBox c5w() => const SizedBox(width: 5);
}
