import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';
// import 'package:umma/features/authentication/presentation/bloc/auth_bloc.dart';
import '../../constants/app_string_constants.dart';
import '../../utilities/appKeys.dart';

class ApiInterceptors extends Interceptor {
  late Box box;
  final Dio _dio;

  ApiInterceptors(this._dio) {
    initHive();
  }

  Future<void> initHive() async {
    box = await Hive.openBox(AppStringConstants.appName);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    log('*** API Response - Start ***');
    log('${response.data}');
    log('${response.statusMessage}');
    log('*** API Response - End ***');
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);

    options.headers.addAll(
        {AppStringConstants.platform: AppStringConstants.mobilePlatform});

    // get tokens from local storage, you can use Hive or flutter_secure_storage
    final customerAccessToken =
        await box.get(AppStringConstants.customerAccessToken);
    var accessToken = customerAccessToken;

    // add access token to the request header
    options.headers["Authorization"] = "Bearer $accessToken";
    options.headers["lang"] = _getCurrentPathLanguage();
    options.headers["u-source"] = 'mobile-v2';
    log('URI ${options.uri}');
    log('METHOD: ${options.method}');
    log('HEADERS:');
    options.headers.forEach((key, v) => log(' - $key $v'));
    log('BODY: ${options.data} ?? ""');
    options.data.forEach((key, value) {
      log("Key $key : Value $value");
    });
    log('QUERY PARAMS:');
    options.queryParameters.forEach((key, value) {
      log("Key $key : Value $value");
    });
    log('EXTRA: ${options.extra} ?? ""');
    options.extra.forEach((key, value) {
      log("Key $key : Value $value");
    });
    log('*** API Request - End ***');
  }

  static String _getCurrentPathLanguage() {
    return AppKeys.materialKey.currentContext!.locale.languageCode;
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Future.delayed(
    //     const Duration(seconds: 5), () {
    //       return super.onError(err, handler);
    //     });
    if (err.response?.statusCode == 401) {
      // for some reasons the token can be invalidated before it is expired by the backend.
      // then we should navigate the user back to login page

      _performLogout(_dio);
    }

    log("***** onError Start");
    log(err.toString());
    log(err.message??"");
    log(err.error.toString());
    log(err.type.toString());
    log(err.response!.data!.toString());
    log("***** onError End");
    return handler.next(err);
  }

  void _performLogout(Dio dio) async {
    // getIt<AuthBloc>().add(LogoutEvent());
  }
}
