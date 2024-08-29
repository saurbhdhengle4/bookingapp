import 'dart:convert';

import 'package:bookingdemoapp/app/data/api_services.dart';
import 'package:bookingdemoapp/app/data/booking_model.dart';
import 'package:bookingdemoapp/app/data/data_retrive_services.dart';
import 'package:bookingdemoapp/app/data/package_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  final ApiService apiService = ApiService();
  RxBool isPageLoading = false.obs;
  RxList<PackageList> packageList = <PackageList>[].obs;
  RxList<BookingList> bookingList = <BookingList>[].obs;
  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  loadData() async {
    try {
      isPageLoading.value = true;
      await getBookingData();
      await getPackages();
    } finally {
      isPageLoading.value = false;
    }
  }

  getPackages() async {
    try {
      http.Response response =
          await apiService.getData("packages_list", query: {});

      if (response.statusCode == 200) {
        DataRetriever retriever = DataRetriever(jsonDecode(response.body));
        if (retriever.getString("code") == "200") {
          List<dynamic> dynamicList = retriever.getList("response");
          packageList.value =
              dynamicList.map((item) => PackageList.fromJson(item)).toList();
        }
      }
    } finally {
      isPageLoading.value = false;
    }
  }

  getBookingData() async {
    try {
      http.Response response = await apiService.getData("current_booking_list");

      if (response.statusCode == 200) {
        DataRetriever retriever = DataRetriever(jsonDecode(response.body));
        if (retriever.getString("code") == "200") {
          List<dynamic> dynamicList = retriever.getList("response");
          bookingList.value =
              dynamicList.map((item) => BookingList.fromJson(item)).toList();
        }
      }
    } finally {}
  }
}
