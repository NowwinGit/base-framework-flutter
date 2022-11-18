import 'dart:convert';

import 'package:dio/dio.dart';


class BaseApiProvider {


  static var baseUrl = "http://restapi.adequateshop.com/";

  late Map<String, dynamic> _config;



  dynamic get apiBaseUrl {
    return _config[baseUrl];
  }



  BaseOptions? options;
  // String baseUrl = "";
  late Dio dio;


  BaseApiProvider() {
    BaseOptions options = BaseOptions(
      // baseUrl: baseUrl,
      sendTimeout: 60000,
      connectTimeout: 60000,
      receiveTimeout: 60000,
    );
    dio = Dio(options);
    dio.interceptors.add(AuthInterceptor());
  }



  dynamic getResponseData(Response response) {

    switch (response.statusCode) {
      case 200:
        return response.data;
      case 204:
        return response;
      case 400:

        throw Exception(response.data.toString());
      case 401:
          throw Exception(response.data.toString());
      case 403:
         throw Exception(response.data.toString());
      case 500:
        throw Exception(response.data.toString());
      default:
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
class AuthInterceptor extends Interceptor {
  static bool isRetryCall = false;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }
}


