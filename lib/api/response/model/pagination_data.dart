import 'package:json_annotation/json_annotation.dart';

part 'pagination_data.g.dart';

@JsonSerializable()
class PaginationData {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "nextPage")
  final int? nextPage;

  PaginationData ({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  factory PaginationData.fromJson(Map<String, dynamic> json) {
    return _$PaginationDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PaginationDataToJson(this);
  }
}