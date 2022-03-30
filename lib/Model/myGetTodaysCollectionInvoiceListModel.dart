// To parse this JSON data, do
//
//     final myGetTodaysCollectionInvoiceListModel = myGetTodaysCollectionInvoiceListModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<MyGetTodaysCollectionInvoiceListModel>
    myGetTodaysCollectionInvoiceListModelFromJson(String str) =>
        List<MyGetTodaysCollectionInvoiceListModel>.from(json
            .decode(str)
            .map((x) => MyGetTodaysCollectionInvoiceListModel.fromJson(x)));

String myGetTodaysCollectionInvoiceListModelToJson(
        List<MyGetTodaysCollectionInvoiceListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyGetTodaysCollectionInvoiceListModel {
  MyGetTodaysCollectionInvoiceListModel({
    this.rowNumber,
    this.retailerName,
    this.retailerId,
    this.retailerCode,
    this.netAmount,
    this.colorCode,
  });

  int? rowNumber;
  String? retailerName;
  int? retailerId;
  String? retailerCode;
  double? netAmount;
  String? colorCode;

  factory MyGetTodaysCollectionInvoiceListModel.fromJson(
          Map<String, dynamic> json) =>
      MyGetTodaysCollectionInvoiceListModel(
        rowNumber: json["RowNumber"],
        retailerName: json["RetailerName"],
        retailerId: json["RetailerId"],
        retailerCode: json["RetailerCode"],
        netAmount: json["NetAmount"].toDouble(),
        colorCode: json["ColorCode"],
      );

  Map<String, dynamic> toJson() => {
        "RowNumber": rowNumber,
        "RetailerName": retailerName,
        "RetailerId": retailerId,
        "RetailerCode": retailerCode,
        "NetAmount": netAmount,
        "ColorCode": colorCode,
      };
}
