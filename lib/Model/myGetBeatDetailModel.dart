// To parse this JSON data, do
//
//     final myGetBeatDetailModel = myGetBeatDetailModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<MyGetBeatDetailModel> myGetBeatDetailModelFromJson(String str) =>
    List<MyGetBeatDetailModel>.from(
        json.decode(str).map((x) => MyGetBeatDetailModel.fromJson(x)));

String myGetBeatDetailModelToJson(List<MyGetBeatDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyGetBeatDetailModel {
  MyGetBeatDetailModel({
    this.retailerInvoiceId,
    this.retailerCode,
    this.retailerName,
    this.amountReceived,
    this.paymentMode,
  });

  int? retailerInvoiceId;
  String? retailerCode;
  String? retailerName;
  String? amountReceived;
  int? paymentMode;

  factory MyGetBeatDetailModel.fromJson(Map<String, dynamic> json) =>
      MyGetBeatDetailModel(
        retailerInvoiceId: json["RetailerInvoiceId"],
        retailerCode: json["RetailerCode"],
        retailerName: json["RetailerName"],
        amountReceived: json["AmountReceived"],
        paymentMode: json["PaymentMode"],
      );

  Map<String, dynamic> toJson() => {
        "RetailerInvoiceId": retailerInvoiceId,
        "RetailerCode": retailerCode,
        "RetailerName": retailerName,
        "AmountReceived": amountReceived,
        "PaymentMode": paymentMode,
      };
}
