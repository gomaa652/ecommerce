import 'package:json_annotation/json_annotation.dart';

part 'base_data_list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
@JsonSerializable(includeIfNull: false)
class BaseDataListResponse<T> {
  bool? success;
  List<T>? data;
  String? message;

  BaseDataListResponse({
    this.success,
    this.data,
    this.message,
  });

  BaseDataListResponse.fromJson(
      Map<String, dynamic>? json, Function(Map<String, dynamic>) create) {
    if (json != null) {
      success = json['success'] as bool;
      json['data']?.forEach((v) {
        data!.add(create(v as Map<String, dynamic>) as T);
      });
      message = json['message'] as String;
    }
  }
}
