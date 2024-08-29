import 'package:bookingdemoapp/app/modules/home/controllers/data_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

class BookingBindingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataController());
  }
}
