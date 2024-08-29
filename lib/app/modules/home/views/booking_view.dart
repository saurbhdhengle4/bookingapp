import 'package:bookingdemoapp/app/data/booking_model.dart';
import 'package:bookingdemoapp/app/data/colors.dart';
import 'package:bookingdemoapp/app/modules/home/controllers/data_controller.dart';
import 'package:bookingdemoapp/app/modules/home/views/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Get.find<DataController>().bookingList.length,
          itemBuilder: (context, index) {
            BookingList data = Get.find<DataController>().bookingList[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
                border: Border.all(color: Colors.grey.withOpacity(0.1)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.title ?? "",
                        style: TextStyle(
                            color: UIC.pinkDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      ButtonWidget(
                        text: 'Start',
                        width: 0.26,
                        color: UIC.pinkDark,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "From",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: UIC.textColorDark),
                              ),
                              c5(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    size: 15,
                                    color: UIC.pinkDark,
                                  ),
                                  c5w(),
                                  Text(data.fromDate ?? "",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: UIC.textColorDark)),
                                ],
                              ),
                              c5(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.schedule,
                                    size: 15,
                                    color: UIC.pinkDark,
                                  ),
                                  c5w(),
                                  Text(data.fromTime ?? "",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: UIC.textColorDark)),
                                ],
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "To",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: UIC.textColorDark),
                              ),
                              c5(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    size: 15,
                                    color: UIC.pinkDark,
                                  ),
                                  c5w(),
                                  Text(data.toDate ?? "",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: UIC.textColorDark)),
                                ],
                              ),
                              c5(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.schedule,
                                    size: 15,
                                    color: UIC.pinkDark,
                                  ),
                                  c5w(),
                                  Text(data.toTime ?? "",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: UIC.textColorDark)),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Flexible(
                          child: ButtonWidget2(
                        text: "Rate Us",
                        icon: Icons.star_border,
                        width: 0.3,
                      )),
                      c5w(),
                      const Flexible(
                          child: ButtonWidget2(
                              text: "Geolocation",
                              icon: Icons.location_on_outlined,
                              width: 0.3)),
                      c5w(),
                      const Flexible(
                          child: ButtonWidget2(
                              text: "Surveillance",
                              icon: Icons.usb,
                              width: 0.3)),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  SizedBox c5() => const SizedBox(height: 5);
  SizedBox c5w() => const SizedBox(width: 5);
}
