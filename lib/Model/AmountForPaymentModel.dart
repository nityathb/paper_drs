// To parse this JSON data, do
//
//     final amountForPaymentModel = amountForPaymentModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<AmountForPaymentModel> amountForPaymentModelFromJson(String str) => List<AmountForPaymentModel>.from(json.decode(str).map((x) => AmountForPaymentModel.fromJson(x)));

String amountForPaymentModelToJson(List<AmountForPaymentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AmountForPaymentModel {
    AmountForPaymentModel({
        this.amountForPayment,
    });

    String? amountForPayment;

    factory AmountForPaymentModel.fromJson(Map<String, dynamic> json) => AmountForPaymentModel(
        amountForPayment: json["AmountForPayment"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "AmountForPayment": amountForPayment,
    };
}
