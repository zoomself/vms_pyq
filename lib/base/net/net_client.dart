import 'package:VMESHOU/base/net/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../generated/json/base/json_convert_content.dart';
import 'api_result_exception.dart';

class NetClient {
  late Dio _dio;
  static final NetClient _netClient = NetClient._internal();
  final TokenInterceptor _tokenInterceptor = TokenInterceptor();
  final LogInterceptor _logInterceptor = LogInterceptor(
      request: false,
      requestHeader: false,
      requestBody: false,
      responseHeader: false,
      responseBody: true);

  NetClient._internal() {
    _dio = Dio();
    _dio.interceptors.add(_tokenInterceptor);
    _dio.interceptors.add(_logInterceptor);
  }

  factory NetClient() {
    return _netClient;
  }

  void get<T>(String url,
      {Map<String, dynamic>? queryParameters,
      VoidCallback? onStart,
      ValueChanged<T>? onSuccess,
      VoidCallback? onComplete,
      ValueChanged<Exception>? onError}) {
    RequestOptions requestOptions = RequestOptions(
      path: url,
      method: "get",
      queryParameters: queryParameters,
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
      sendTimeout: 30 * 1000,
    );
    fetch(requestOptions,
        onStart: onStart,
        onSuccess: onSuccess,
        onComplete: onComplete,
        onError: onError);
  }

  void post<T>(String url,
      {dynamic data,
      VoidCallback? onStart,
      ValueChanged<T>? onSuccess,
      VoidCallback? onComplete,
      ValueChanged<Exception>? onError}) {
    RequestOptions requestOptions = RequestOptions(
      path: url,
      method: "post",
      data: data,
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
      sendTimeout: 30 * 1000,
    );

    fetch(requestOptions,
        onStart: onStart,
        onSuccess: onSuccess,
        onComplete: onComplete,
        onError: onError);
  }

  void fetch<T>(RequestOptions requestOptions,
      {VoidCallback? onStart,
      ValueChanged<T>? onSuccess,
      VoidCallback? onComplete,
      ValueChanged<Exception>? onError}) async {
    if (onStart != null) {
      onStart();
    }
    Response? response;
    try {
      response = await _dio.fetch(requestOptions);
      var statusCode = response.statusCode;
      if (statusCode != null && statusCode == 200) {
        var data = response.data;
        if (data != null) {
          var responseData = data["datas"];
          var respCode = data["resp_code"];
          var respMsg = data["resp_msg"];
          if (respCode != 0) {
            var are = ApiResultException(respMsg);
            are.code = respCode;
            throw are;
          } else {
            T? t = JsonConvert.fromJsonAsT<T>(responseData);
            if (t == null) {
              if (onComplete != null) {
                onComplete();
              }
            } else {
              if (onSuccess != null) {
                onSuccess(t);
              }
            }
          }
        } else {
          throw ApiResultException("response data is null");
        }
      } else {
        throw Exception(response.statusMessage);
      }
    } on Exception catch (e) {
      //单独处理异常
      if (onError != null) {
        onError(e);
      } else {
        //统一处理异常
        DioError dioError = DioError(
            requestOptions: requestOptions, response: response, error: e);
        _tokenInterceptor.onError(dioError, ErrorInterceptorHandler());
      }
    }
  }
}
