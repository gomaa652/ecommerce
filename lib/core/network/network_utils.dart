import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:yalla_client/core/data/error_response/app_error_response_model.dart';

import 'api_error_handler.dart';
import 'data_state.dart';

class NetworkUtils<T> {
  Future<DataState<T>> handleApiResponse(Future<HttpResponse<T>> function,
      {bool? ignoreResponse}) async {
    try {
      final httpResponse = await function;
      if ((httpResponse.response.statusCode == HttpStatus.ok) ||
          (httpResponse.response.statusCode == HttpStatus.created)) {
        if (ignoreResponse != null && ignoreResponse) {
          return DataSuccess(httpResponse.data);
        } else {
          if (httpResponse.response.data != null) {
            return DataSuccess(httpResponse.data);
          }
        }
      }
      return DataFailed(
        ApiErrorHandler.getMessage(
          DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: RequestOptions(),
          ),
        ),
      );
    } on DioError catch (dioError) {
      String? errorDescription = dioError.message;
      if (dioError.response?.data != null) {
        ErrorResponseModel? errorRes;
        if (dioError.response!.data! is String) {
          errorRes = ErrorResponseModel.fromJson(
              jsonDecode(dioError.response!.data! as String));
        } else if (dioError.response!.data! is Map<String, dynamic>) {
          errorRes = ErrorResponseModel.fromJson(dioError.response!.data);
        }
        if (errorRes?.message != null) {
          errorDescription = errorRes!.message;
        }
      }
      return DataFailed(errorDescription ?? "Unexpected error occurred");
    } catch (e) {
      return DataFailed(ApiErrorHandler.getMessage(e));
    }
  }
}

class VoidResponse {
  VoidResponse();

  factory VoidResponse.fromJson(Map<String, dynamic>? json) => VoidResponse();
}
