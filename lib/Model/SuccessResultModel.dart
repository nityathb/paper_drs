// To parse this JSON data, do
//
//     final successResultModel = successResultModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

SuccessResultModel successResultModelFromJson(String str) =>
    SuccessResultModel.fromJson(json.decode(str));

String successResultModelToJson(SuccessResultModel data) =>
    json.encode(data.toJson());

class SuccessResultModel {
  SuccessResultModel({
    this.errorMessage,
    this.errorCode,
    this.referenceNumber,
  });

  String? errorMessage;
  String? errorCode;
  String? referenceNumber;

  factory SuccessResultModel.fromJson(Map<String, dynamic> json) =>
      SuccessResultModel(
        errorMessage: json["ErrorMessage"],
        errorCode: json["ErrorCode"],
        referenceNumber: json["ReferenceNumber"],
      );

  Map<String, dynamic> toJson() => {
        "ErrorMessage": errorMessage,
        "ErrorCode": errorCode,
        "ReferenceNumber": referenceNumber,
      };
}
