// To parse this JSON data, do
//
//     final myGetRouteModel = myGetRouteModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<MyGetRouteModel> myGetRouteModelFromJson(String str) =>
    List<MyGetRouteModel>.from(
        json.decode(str).map((x) => MyGetRouteModel.fromJson(x)));

String myGetRouteModelToJson(List<MyGetRouteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyGetRouteModel {
  MyGetRouteModel({
    this.salesmanId,
    this.salesmanName,
    this.salesmanCode,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  int? salesmanId;
  String? salesmanName;
  String? salesmanCode;
  String? monday;
  String? tuesday;
  String? wednesday;
  String? thursday;
  String? friday;
  String? saturday;
  String? sunday;

  factory MyGetRouteModel.fromJson(Map<String, dynamic> json) =>
      MyGetRouteModel(
        salesmanId: json["SalesmanId"],
        salesmanName: json["SalesmanName"],
        salesmanCode: json["SalesmanCode"],
        monday: json["Monday"],
        tuesday: json["Tuesday"],
        wednesday: json["Wednesday"],
        thursday: json["Thursday"],
        friday: json["friday"],
        saturday: json["Saturday"],
        sunday: json["Sunday"],
      );

  Map<String, dynamic> toJson() => {
        "SalesmanId": salesmanId,
        "SalesmanName": salesmanName,
        "SalesmanCode": salesmanCode,
        "Monday": monday,
        "Tuesday": tuesday,
        "Wednesday": wednesday,
        "Thursday": thursday,
        "friday": friday,
        "Saturday": saturday,
        "Sunday": sunday,
      };
}
