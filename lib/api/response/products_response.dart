import 'package:c3_offline/api/response/model/pagination_data.dart';
import 'package:c3_offline/api/response/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final PaginationData? metadata;
  @JsonKey(name: "data")
  final List<ProductDto>? data;

  ProductsResponse ({
    this.results,
    this.metadata,
    this.data,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsResponseToJson(this);
  }
}





