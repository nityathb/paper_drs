// ignore_for_file: file_names

// import 'dart:convert';

// import 'package:paper_drs/Contants/api_constant.dart';
// import 'package:paper_drs/controllers/base_controller.dart';
// import 'package:paper_drs/helper/dialog_helper.dart';
// import 'package:paper_drs/service/app_exception.dart';
// import 'package:paper_drs/service/dio_client.dart';
// import 'package:get/get.dart';

// class WorkController extends GetxController with BaseController {
//   // void getData() async {
//   //   showLoading('Fetching data');
//   //   var response = await DioClient()
//   //       .get('https://jsonplaceholder.typicode.com', '/todos/1')
//   //       .catchError(handleError);
//   //   if (response == null) return;
//   //   hideLoading();
//   // }

//   void fetchList(dynamic data, String subUrl,
//       {void Function(dynamic)? onSuccess}) async {
//     print("request");
//     showLoading('Posting data...');
//     var response = await DioClient().post(baseUrl, subUrl, data)
//         // .then((value) => {})
//         .catchError((error) {
//       print("error $error");

//       if (error is BadRequestException) {
//         var apiError = json.decode(error.message!);
//         DialogHelper.showErroDialog(description: apiError["reason"]);
//       } else {
//         handleError(error);
//       }
//     });

//     if (response == null) return;
//     hideLoading();
//     print(response);
//     onSuccess!(response);
//   }

//   // void getOTP(dynamic data, {void Function(dynamic)? onSuccess}) async {
//   //   showLoading('Posting data...');
//   //   var response = await DioClient().post(baseUrl, sendOtp, data)
//   //       // .then((value) => {})
//   //       .catchError((error) {
//   //     print("error $error");

//   //     if (error is BadRequestException) {
//   //       var apiError = json.decode(error.message!);
//   //       DialogHelper.showErroDialog(description: apiError["reason"]);
//   //     } else {
//   //       handleError(error);
//   //     }
//   //   });
//   //   if (response == null) return;
//   //   hideLoading();
//   //   print(response);
//   //   onSuccess!(response);
//   // }

//   // void signUp(dynamic data, {void Function(dynamic)? onSuccess}) async {
//   //   print("request");
//   //   showLoading('Posting data...');
//   //   var response = await DioClient().post(baseUrl, signUpAPi, data)
//   //       // .then((value) => {})
//   //       .catchError((error) {
//   //     print("error $error");

//   //     if (error is BadRequestException) {
//   //       var apiError = json.decode(error.message!);
//   //       DialogHelper.showErroDialog(description: apiError["reason"]);
//   //     } else {
//   //       handleError(error);
//   //     }
//   //   });

//   //   if (response == null) return;
//   //   hideLoading();
//   //   print(response);
//   //   onSuccess!(response);
//   // }
// }
