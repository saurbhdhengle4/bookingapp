// To parse this JSON data, do
//
//     final bookingListModel = bookingListModelFromJson(jsonString);

import 'dart:convert';

BookingListModel bookingListModelFromJson(String str) =>
    BookingListModel.fromJson(json.decode(str));

String bookingListModelToJson(BookingListModel data) =>
    json.encode(data.toJson());

class BookingListModel {
  String? code;
  String? status;
  String? message;
  List<BookingList>? response;

  BookingListModel({
    this.code,
    this.status,
    this.message,
    this.response,
  });

  factory BookingListModel.fromJson(Map<String, dynamic> json) =>
      BookingListModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        response: List<BookingList>.from(
            json["response"].map((x) => BookingList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "response": List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class BookingList {
  String? title;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  BookingList({
    this.title,
    this.fromDate,
    this.fromTime,
    this.toDate,
    this.toTime,
  });

  factory BookingList.fromJson(Map<String, dynamic> json) => BookingList(
        title: json["title"],
        fromDate: json["from_date"],
        fromTime: json["from_time"],
        toDate: json["to_date"],
        toTime: json["to_time"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "from_date": fromDate,
        "from_time": fromTime,
        "to_date": toDate,
        "to_time": toTime,
      };
}
