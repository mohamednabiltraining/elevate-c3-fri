import 'package:c3_offline/api/response/model/brand.dart';
import 'package:c3_offline/api/response/model/category.dart';
import 'package:c3_offline/api/response/model/pagination_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final PaginationData? metadata;
  @JsonKey(name: "data")
  final List<CategoryDto>? data;

  CategoriesResponse ({
    this.results,
    this.metadata,
    this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return _$CategoriesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesResponseToJson(this);
  }
}



