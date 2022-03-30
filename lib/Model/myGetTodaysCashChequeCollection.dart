// To parse this JSON data, do
//
//     final myGetTodaysCashChequeCollectionModel = myGetTodaysCashChequeCollectionModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<MyGetTodaysCashChequeCollectionModel>
    myGetTodaysCashChequeCollectionModelFromJson(String str) =>
        List<MyGetTodaysCashChequeCollectionModel>.from(json
            .decode(str)
            .map((x) => MyGetTodaysCashChequeCollectionModel.fromJson(x)));

String myGetTodaysCashChequeCollectionModelToJson(
        List<MyGetTodaysCashChequeCollectionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyGetTodaysCashChequeCollectionModel {
  MyGetTodaysCashChequeCollectionModel({
    this.cashCollection,
    this.chequeCollection,
    this.bankCollection,
  });

  double? cashCollection;
  double? chequeCollection;
  double? bankCollection;

  factory MyGetTodaysCashChequeCollectionModel.fromJson(
          Map<String, dynamic> json) =>
      MyGetTodaysCashChequeCollectionModel(
        cashCollection: json["CashCollection"] ?? 0.0,
        chequeCollection: json["ChequeCollection"] ?? 0.0,
        bankCollection: json["BankCollection"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "CashCollection": cashCollection,
        "ChequeCollection": chequeCollection,
        "BankCollection": bankCollection,
      };
}
