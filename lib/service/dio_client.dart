// ignore_for_file: constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:paper_drs/service/app_exception.dart';

class DioClient {
  static const int TIME_OUT_DURATION = 40;
  //GET
  Future<dynamic> get(String baseUrl, String api, [params]) async {
    var uri = Uri.parse(baseUrl + api);

    try {
      var response = await Dio()
          .get(baseUrl + api)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print("response$response");
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    // var demo=json.en
    try {
      var response = await Dio()
          .post(baseUrl + api, data: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print(response.data);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //DELETE
  //OTHER

  dynamic _processResponse(response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request.url.toString());
    }
  }
}
