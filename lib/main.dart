import 'package:bookingdemoapp/app/modules/home/bindings/home_binding.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialBinding:BookingBindingBinding() ,
      theme: ThemeData(
        fontFamily: 'regular',
      ),
    ),
  );
}
