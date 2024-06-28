import 'package:json_annotation/json_annotation.dart';

part 'pagination_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
@JsonSerializable(includeIfNull: false)
class PaginatedBaseResponse<T> {
  List<T>? items;
  @JsonKey(name: 'total_count')
  int? totalCount;
  PaginatedBaseResponse({
    this.items,
    this.totalCount,
  });

  PaginatedBaseResponse.fromJson(
      Map<String, dynamic>? json, Function(Map<String, dynamic>) create) {
    if (json != null) {
      totalCount = json['total_count'] as int;
      json['items']?.forEach((v) {
        items!.add(create(v as Map<String, dynamic>) as T);
      });
    }
  }

  PaginatedBaseResponse<NewType> copyWith<NewType>({
    List<NewType>? newItems,
    int? newTotalCount,
  }) {
    return PaginatedBaseResponse(
      items: newItems ?? [],
      totalCount: newTotalCount ?? totalCount,
    );
  }
}
