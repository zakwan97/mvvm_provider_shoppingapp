import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:mvvm_provider_shoppingapp/app/constant/nav_bar_constant.dart';
import 'package:mvvm_provider_shoppingapp/app/model/network/my_response.dart';
import 'package:mvvm_provider_shoppingapp/app/util/util.dart';

class BaseServices {
  static BaseServices? _instance;
  static String? hostUrl;

  /// private access dio instance and accessible using dio() getter
  Dio? _dio;

  /// eg: single dio instance will created and reuse by all services.
  /// remove the needs to create new Dio() instance in every services
  Dio? get dio {
    if (_instance == null || _instance?._dio == null) {
      _init();
    }
    return _instance?._dio;
  }

  BaseServices() {
    _init();
  }

  void _init() {
    _instance = this;

    _dio = Dio(
      BaseOptions(
        headers: <String, String>{
          'Content-Type': ContentType.json.value,
        },
      ),
    );
  }

  /// Standardized api calling with try-catch block
  /// Respond with MyResponse object for consistent data/error handling in services layer
  /// Accessible by all inheriting classes
  Future<MyResponse<dynamic, dynamic>> callAPI(
    HttpRequestType requestType,
    String path, {
    Map<String, dynamic>? postBody,
    Options? options,
    bool requiresAuth = true,
  }) async {
    try {
      dio?.options.contentType = Headers.jsonContentType;
      Response<dynamic>? response;

      switch (requestType) {
        case HttpRequestType.GET:
          response = await dio?.get<dynamic>(path, options: options);
          break;
        case HttpRequestType.POST:
          response =
              await dio?.post<dynamic>(path, data: postBody, options: options);
          // log(response!.statusCode.toString());
          break;
        case HttpRequestType.PUT:
          response =
              await dio?.put<dynamic>(path, data: postBody, options: options);
          //  log(response!.statusCode.toString());
          break;
        case HttpRequestType.DELETE:
          response = await dio?.delete<dynamic>(path,
              data: postBody, options: options);
          break;
      }

      if (response?.statusCode == HttpStatus.ok ||
          response?.statusCode == HttpStatus.created) {
        return MyResponse.complete(response?.data);
      }
    } on DioException catch (e) {
      Logger('$BaseServices').info(e);
      // ignore: deprecated_member_use
      if (e.response?.data != null && e.response?.data != '') {
        return MyResponse.error(JsonParsing(e.response?.data).toJson());
      }
      return MyResponse.error(e.response?.data);
    }
    final error = MyResponse<dynamic, dynamic>.error(
      DioException(
        requestOptions: RequestOptions(path: path),
      ),
    );
    Logger('$BaseServices').info(error);
    return error;
  }
}
