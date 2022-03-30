// To parse this JSON data, do
//
//     final myGetProfileModel = myGetProfileModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<MyGetProfileModel> myGetProfileModelFromJson(String str) =>
    List<MyGetProfileModel>.from(
        json.decode(str).map((x) => MyGetProfileModel.fromJson(x)));

String myGetProfileModelToJson(List<MyGetProfileModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyGetProfileModel {
  MyGetProfileModel({
    this.salesmanId,
    this.salesmanName,
    this.mobileNumber,
    this.address,
    this.registeredMacId,
    this.salesmanCode,
    this.active,
    this.fullName,
    this.companyId,
    this.salesmanSysId,
    this.photoId,
    this.salesmanSysId1,
    this.salesmanId1,
    this.photo,
  });

  int? salesmanId;
  String? salesmanName;
  String? mobileNumber;
  String? address;
  String? registeredMacId;
  String? salesmanCode;
  int? active;
  String? fullName;
  String? companyId;
  String? salesmanSysId;
  String? photoId;
  String? salesmanSysId1;
  String? salesmanId1;
  String? photo;

  factory MyGetProfileModel.fromJson(Map<String, dynamic> json) =>
      MyGetProfileModel(
        salesmanId: json["SalesmanId"],
        salesmanName: json["SalesmanName"],
        mobileNumber: json["MobileNumber"],
        address: json["Address"],
        registeredMacId: json["RegisteredMacId"],
        salesmanCode: json["SalesmanCode"],
        active: json["Active"],
        fullName: json["FullName"],
        companyId: json["CompanyId"].toString(),
        salesmanSysId: json["SalesmanSysId"],
        photoId: json["PhotoId"].toString(),
        salesmanSysId1: json["SalesmanSysId1"],
        salesmanId1: json["SalesmanId1"].toString(),
        photo: json["Photo"]??"",
      );

  Map<String, dynamic> toJson() => {
        "SalesmanId": salesmanId,
        "SalesmanName": salesmanName,
        "MobileNumber": mobileNumber,
        "Address": address,
        "RegisteredMacId": registeredMacId,
        "SalesmanCode": salesmanCode,
        "Active": active,
        "FullName": fullName,
        "CompanyId": companyId,
        "SalesmanSysId": salesmanSysId,
        "PhotoId": photoId,
        "SalesmanSysId1": salesmanSysId1,
        "SalesmanId1": salesmanId1,
        "Photo": photo,
      };
}
