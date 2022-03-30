// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const String appName = "Paper DRS";

//Api's
const API_BASE_URL = 'https://api.paperdrs.com/api/';

const SendSMS = API_BASE_URL + 'SendLoginOtp/';

const AUTH_API = API_BASE_URL + 'VerifyLoginOTP/';

const TodaysCollectionInvoiceList_API =
    API_BASE_URL + 'TodaysCollectionInvoiceList/';

const TodaysCashChequeCollection_API =
    API_BASE_URL + 'TodaysCashChequeCollection/';

const ReceivableAndOutstandingAmountWithMeterPercentage_API =
    API_BASE_URL + 'ReceivableAndOutstandingAmountWithMeterPercentage/';

const TodaysReceiveable_API = API_BASE_URL + 'TodaysReceiveable/';

const MyBeats_API = API_BASE_URL + 'MyBeats/';
const BeatDetails_API = API_BASE_URL + 'BeatDetails/';
const GetSalesmanProfile_API = API_BASE_URL + 'GetSalesmanProfile/';

const TodaysCashChequeCollectionReport_API =
    API_BASE_URL + 'TodaysCashChequeCollectionReport/';

const GetCategory_API =
    API_BASE_URL + 'GetCategory/';

const GetPaymentLedger_API =
    API_BASE_URL + 'GetPaymentLedger/';


const GetInvoiceDetails_API =
    API_BASE_URL + 'GetInvoiceDetails/';

const GetAmountForPayment_API =
    API_BASE_URL + 'GetAmountForPayment/';


const ReceivedCashPayment_API =
    API_BASE_URL + 'ReceivedCashPayment/';


const ReceivedChequePayment_API =
    API_BASE_URL + 'ReceivedChequePayment/';

const DeniedPayment_API =
    API_BASE_URL + 'DeniedPayment/';

const Bank_API =
    API_BASE_URL + 'Bank/';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
