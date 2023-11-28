import 'package:dio/dio.dart';
import 'package:dio_intercept_to_curl/dio_intercept_to_curl.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'client_interceptors.dart';

class DioClient {
  DioClient._();

  static Dio get instance => _instance();

  static Dio _instance({String? baseUrl}) {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: baseUrl ?? '',
        receiveDataWhenStatusError: true,
      );

    //? our api interceptors
    dio.interceptors.add(ClientInterceptors());

    //? get cURL for if an error occurs
    dio.interceptors.add(DioInterceptToCurl(
      printOnSuccess: false, //* optional
      convertFormData: true,
    ));

    //? logging
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: false,
      requestBody: true,
      responseHeader: false,
      responseBody: false,
      error: true,
      compact: false,
      maxWidth: 200,
    ));

    return dio;
  }
}
