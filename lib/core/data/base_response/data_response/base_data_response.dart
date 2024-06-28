import 'package:json_annotation/json_annotation.dart';

part 'base_data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
@JsonSerializable(includeIfNull: false)
class BaseDataResponse<T> {
  bool? success;
  T? data;
  String? message;

  BaseDataResponse({
    this.success,
    this.data,
    this.message,
  });

  BaseDataResponse.fromJson(
      Map<String, dynamic>? json, Function(Map<String, dynamic>) create) {
    if (json != null) {
      success = json['success'] as bool;
      data = create(json['data'] as Map<String, dynamic>) as T;
      message = json['message'] as String;
    }
  }
}
