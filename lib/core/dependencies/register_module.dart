import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../utilities/environment/environment_configurations.dart';
import 'interceptor/api_interceptor.dart';

/// this class register the third party plugins
@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  @Named("BaseUrl")
  String get baseUrl => EnvironmentsVariables().configurations.baseUrl;

  @Named('Dio')
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) {
    final Dio dio = Dio(BaseOptions(baseUrl: url));
    dio.interceptors.add(ApiInterceptors(dio));
    return dio;
  }

  @Named('Interceptor')
  @lazySingleton
  Dio dioInterceptor(@Named('BaseUrl') String url) =>
      Dio(BaseOptions(baseUrl: url));
}
