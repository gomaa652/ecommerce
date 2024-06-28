// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_data_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseDataListResponse<T> _$BaseDataListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseDataListResponse<T>(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseDataListResponseToJson<T>(
  BaseDataListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data?.map(toJsonT).toList(),
      'message': instance.message,
    };
