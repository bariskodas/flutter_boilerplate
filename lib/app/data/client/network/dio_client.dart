import 'package:dio/dio.dart';
import 'package:dio_intercept_to_curl/dio_intercept_to_curl.dart';

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
    
    return dio;
  }
}
