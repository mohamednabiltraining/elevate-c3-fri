// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandsResponse _$BrandsResponseFromJson(Map<String, dynamic> json) =>
    BrandsResponse(
      results: (json['results'] as num?)?.toInt(),
      metadata:
          json['metadata'] == null
              ? null
              : PaginationData.fromJson(
                json['metadata'] as Map<String, dynamic>,
              ),
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => BrandDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$BrandsResponseToJson(BrandsResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'metadata': instance.metadata,
      'data': instance.data,
    };
