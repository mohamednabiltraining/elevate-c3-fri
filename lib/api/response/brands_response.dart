import 'package:c3_offline/api/response/BaseResponse.dart';
import 'package:c3_offline/api/response/model/brand.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:c3_offline/api/response/model/pagination_data.dart';

part 'brands_response.g.dart';

@JsonSerializable()
class BrandsResponse extends BaseResponse<List<BrandDto>?>{

  BrandsResponse ({
    super.results,
    super.metadata,
    super.data,
  });

  factory BrandsResponse.fromJson(Map<String, dynamic> json) {
    return _$BrandsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrandsResponseToJson(this);
  }
}



