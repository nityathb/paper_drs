// ignore_for_file: file_names

// import 'dart:convert';

// import 'package:paper_drs/Contants/api_constant.dart';
// import 'package:paper_drs/controllers/base_controller.dart';
// import 'package:paper_drs/helper/dialog_helper.dart';
// import 'package:paper_drs/service/app_exception.dart';
// import 'package:paper_drs/service/dio_client.dart';
// import 'package:get/get.dart';

// class LeadStatusChange extends GetxController with BaseController {
//   void sayYesMethod(String leadId, {void Function(dynamic) onSuccess}) async {
//     showLoading('Sending OTP...');
//     var response =
//         await DioClient().get(baseUrl, sendOtpForLoan + "?lead_id=$leadId")
//             // .then((value) => {})
//             .catchError((error) {
//       print("error $error");

//       if (error is BadRequestException) {
//         var apiError = json.decode(error.message);
//         DialogHelper.showErroDialog(description: apiError["reason"]);
//       } else {
//         handleError(error);
//       }
//     });
//     if (response == null) return;
//     hideLoading();
//     print(response);
//     onSuccess(response);
//   }

//   void sayNoMethod(String leadid, String remark,
//       {void Function(dynamic) onSuccess}) async {
//     showLoading('Please wait...');
//     var response = await DioClient()
//         .get(baseUrl, canceledByManager + "?lead_id=$leadid&remarks=$remark")
//         // .then((value) => {})
//         .catchError((error) {
//       print("error $error");

//       if (error is BadRequestException) {
//         var apiError = json.decode(error.message);
//         DialogHelper.showErroDialog(description: apiError["reason"]);
//       } else {
//         handleError(error);
//       }
//     });
//     if (response == null) return;
//     hideLoading();
//     print(response);
//     onSuccess(response);
//   }

//   void otpCheckMethod(String leadId, String otp,
//       {void Function(dynamic) onSuccess}) async {
//     showLoading('Verify OTP...');
//     var response = await DioClient()
//         .get(baseUrl, verifyOtpForLoan + "?lead_id=$leadId&otp=$otp")
//         // .then((value) => {})
//         .catchError((error) {
//       print("error $error");

//       if (error is BadRequestException) {
//         var apiError = json.decode(error.message);
//         DialogHelper.showErroDialog(description: apiError["reason"]);
//       } else {
//         handleError(error);
//       }
//     });
//     if (response == null) return;
//     hideLoading();
//     print(response);
//     onSuccess(response);
//   }
// }
