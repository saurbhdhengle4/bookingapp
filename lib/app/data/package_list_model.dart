// To parse this JSON data, do
//
//     final packageListModel = packageListModelFromJson(jsonString);

import 'dart:convert';

PackageListModel packageListModelFromJson(String str) =>
    PackageListModel.fromJson(json.decode(str));

String packageListModelToJson(PackageListModel data) =>
    json.encode(data.toJson());

class PackageListModel {
  String? code;
  String? status;
  String? message;
  List<PackageList>? response;

  PackageListModel({
    this.code,
    this.status,
    this.message,
    this.response,
  });

  factory PackageListModel.fromJson(Map<String, dynamic> json) =>
      PackageListModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        response: List<PackageList>.from(
            json["response"].map((x) => PackageList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "response": List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class PackageList {
  String? title;
  String? price;
  String? desc;

  PackageList({
    this.title,
    this.price,
    this.desc,
  });

  factory PackageList.fromJson(Map<String, dynamic> json) => PackageList(
        title: json["title"],
        price: json["price"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "desc": desc,
      };
}
