// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) =>
    CategoriesResponse(
      results: (json['results'] as num?)?.toInt(),
      metadata:
          json['metadata'] == null
              ? null
              : PaginationData.fromJson(
                json['metadata'] as Map<String, dynamic>,
              ),
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CategoriesResponseToJson(CategoriesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'metadata': instance.metadata,
      'data': instance.data,
    };
