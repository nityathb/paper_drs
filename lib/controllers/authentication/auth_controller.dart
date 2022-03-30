// import 'dart:convert';

// import 'package:paper_drs/Contants/URLsList.dart';
// import 'package:paper_drs/controllers/base_controller.dart';
// import 'package:paper_drs/helper/dialog_helper.dart';
// import 'package:paper_drs/service/app_exception.dart';
// import 'package:paper_drs/service/dio_client.dart';
// import 'package:get/get.dart';

// class AuthController extends GetxController with BaseController {
//   void loginMethod(dynamic data, {void Function(dynamic)? onSuccess}) async {
//     showLoading('Posting data...');
//     var response = await DioClient().post(baseUrl, loginAPI, data)
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
// }
