import 'dart:developer';

import 'package:dio/dio.dart';

import '../data/error_response/app_error_response_model.dart';

class ApiErrorHandler {
  static String getMessage(error) {
    // log("Api Error Handler");
    String errorDescription = "Unexpected error occurred";
    // print("ApiErrorHandler " + " error " + error.toString() + " " + error.runtimeType.toString());
    if (error is Exception) {
      try {
        if (error is DioError && error.response?.data is Map<String, dynamic>) {
          final errorRes = ErrorResponseModel.fromJson(
              error.response!.data! as Map<String, dynamic>);
          if (errorRes.message != null) {
            errorDescription = errorRes.message!;
          }
        }
      } catch (e) {
        errorDescription = e.toString();
      }
    }
    log(errorDescription);
    return errorDescription;
  }
}
