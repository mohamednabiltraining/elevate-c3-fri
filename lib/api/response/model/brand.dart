
import 'package:c3_offline/domain/model/brand.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable()
class BrandDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;

  BrandDto ({
    this.Id,
    this.name,
    this.slug,
    this.image,
  });

  factory BrandDto.fromJson(Map<String, dynamic> json) {
    return _$BrandDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrandDtoToJson(this);
  }

  Brand toBrand(){
    return Brand(
      Id: Id,
      name: name,
      slug: slug,
      image: image
    );
  }
}
