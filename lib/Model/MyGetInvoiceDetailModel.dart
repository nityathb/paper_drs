// To parse this JSON data, do
//
//     final myGetInvoiceDetailModel = myGetInvoiceDetailModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, file_names

import 'dart:convert';

List<MyGetInvoiceDetailModel> myGetInvoiceDetailModelFromJson(String str) =>
    List<MyGetInvoiceDetailModel>.from(
        json.decode(str).map((x) => MyGetInvoiceDetailModel.fromJson(x)));

String myGetInvoiceDetailModelToJson(List<MyGetInvoiceDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyGetInvoiceDetailModel {
  MyGetInvoiceDetailModel({
    this.key,
    this.billNumber,
    this.value,
    this.categoryName,
    this.sequence,
    this.rowDate,
    this.retailerInvoiceId,
    this.salesReturn,
    this.expiry,
    this.creditNote,
    this.colorCode,
  });

  String? key;
  String? billNumber;
  double? value;
  String? categoryName;
  String? sequence;
  String? rowDate;
  int? retailerInvoiceId;
  String? salesReturn;
  String? expiry;
  String? creditNote;
  String? colorCode;

  factory MyGetInvoiceDetailModel.fromJson(Map<String, dynamic> json) =>
      MyGetInvoiceDetailModel(
        key: json["Key"],
        billNumber: json["BillNumber"],
        value: json["Value"],
        categoryName:
            json["CategoryName"] == null ? null : json["CategoryName"],
        sequence: json["Sequence"],
        rowDate: json["RowDate"],
        retailerInvoiceId: json["RetailerInvoiceId"],
        salesReturn: json["SalesReturn"] == null ? null : json["SalesReturn"],
        expiry: json["Expiry"] == null ? null : json["Expiry"],
        creditNote: json["CreditNote"] == null ? null : json["CreditNote"],
        colorCode: json["ColorCode"],
      );

  Map<String, dynamic> toJson() => {
        "Key": key,
        "BillNumber": billNumber,
        "Value": value,
        "CategoryName": categoryName == null ? null : categoryName,
        "Sequence": sequence,
        "RowDate": rowDate,
        "RetailerInvoiceId": retailerInvoiceId,
        "SalesReturn": salesReturn == null ? null : salesReturn,
        "Expiry": expiry == null ? null : expiry,
        "CreditNote": creditNote == null ? null : creditNote,
        "ColorCode": colorCode,
      };
}
