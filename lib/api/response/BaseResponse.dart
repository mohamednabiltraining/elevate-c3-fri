import 'package:c3_offline/api/response/model/pagination_data.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class BaseResponse<T> {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final PaginationData? metadata;
  @JsonKey(name: "data")
  final T? data;

  BaseResponse ({
    this.results,
    this.metadata,
    this.data,
  });

  // factory BaseResponse.fromJson(Map<String, dynamic> json) {
  //   return _$BaseResponseFromJson(json);
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return _$BaseResponseToJson(this);
  // }
}



