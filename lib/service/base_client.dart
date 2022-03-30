// ignore_for_file: constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:paper_drs/service/app_exception.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int TIME_OUT_DURATION = 20;
  // get
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http
          .get(uri)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Api Not responded in time", uri.toString());
    } catch (e) {
      print(e);
    }
  }

  // post
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    // var payload = json.decode(payloadObj);
    try {
      var response = await http
          .post(uri, body: payloadObj)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print("result$response");

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Api Not responded in time", uri.toString());
    }
  }

  // Delete
  // Other

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
       return responseJson;
      
      case 400:
        throw BadRequestException(
          utf8.decode(response.bodyBytes),
          response.request?.url.toString(),
        );
      case 401:
      case 402:
      case 403:
        throw UnAuthorizedException(
          utf8.decode(response.bodyBytes),
          response.request?.url.toString(),
        );
      case 500:
      default:
        throw FetchDataException(
          "Error occured with code : ${response.statusCode}",
          response.request?.url.toString(),
        );
    }
  }
}
