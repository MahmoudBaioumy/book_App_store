import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: EndPoint.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        }));

    dio?.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 999,
      enabled: kDebugMode,
    ));
  }

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query}) async {
    String token = SharedPreferencHelper.getData(key: 'token');
    dio!.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'authorization': 'Bearer $token',
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? data,
      String? token,
      int? id}) async {
    dio!.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'authorization': 'Bearer $token',
    };
    return await dio!.post(url, data: data);
  }

  static Future<Response> grtDataById(
      {Map<String, dynamic>? query, required int id, int? token}) async {
    dio!.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    return await dio!.get('https://codingarabic.online/api/products/$id',
        queryParameters: query);
  }

  static Future<Response> grtDataByIdandtoken(
      {Map<String, dynamic>? query,
      required int id,
      required String? token}) async {
    dio!.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'authorization': 'Bearer $token',
    };
    return await dio!.get('https://codingarabic.online/api/add-to-wishlist/$id',
        queryParameters: query);
  }

  static Future<Response> grtDataBycategori({
    Map<String, dynamic>? query,
    required int id,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    return await dio!.get('https://codingarabic.online/api/categories/$id',
        queryParameters: query);
  }
}
