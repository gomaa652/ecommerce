// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedBaseResponse<T> _$PaginatedBaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedBaseResponse<T>(
      items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
      totalCount: json['total_count'] as int?,
    );

Map<String, dynamic> _$PaginatedBaseResponseToJson<T>(
  PaginatedBaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': instance.items?.map(toJsonT).toList(),
      'total_count': instance.totalCount,
    };
