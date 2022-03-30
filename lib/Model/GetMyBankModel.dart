// To parse this JSON data, do
//
//     final getBankModel = getBankModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<GetBankModel> getBankModelFromJson(String str) =>
    List<GetBankModel>.from(
        json.decode(str).map((x) => GetBankModel.fromJson(x)));

String getBankModelToJson(List<GetBankModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetBankModel {
  GetBankModel({
    this.BankId,
    this.BankName,
    this.active,
  });

  int? BankId;
  String? BankName;
  bool? active;

  factory GetBankModel.fromJson(Map<String, dynamic> json) =>
      GetBankModel(
        BankId: json["BankId"],
        BankName: json["BankName"],
        active: json["Active"],
      );

  Map<String, dynamic> toJson() => {
        "BankId": BankId,
        "BankName": BankName,
        "Active": active,
      };
}
