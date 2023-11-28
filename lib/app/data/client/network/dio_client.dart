import 'package:dio/dio.dart';

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

    dio.interceptors.add(ClientInterceptors());
    return dio;
  }
}
