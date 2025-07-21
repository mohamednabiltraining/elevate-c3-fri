import 'package:c3_offline/api/response/model/brand.dart';
import 'package:c3_offline/domain/model/brand.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call toBrand with null values it should return Brand with null values', () {
    BrandDto brandDto = BrandDto(
      Id: null,
      name: null,
      slug: null,
      image: null,
    );
    Brand result = brandDto.toBrand();
    expect(result.Id, isNull);
    expect(result.name, isNull);
    expect(result.slug, isNull);
    expect(result.image, isNull);
  });
  test('when call toBrand with non-null values it should return Brand with correct values', () {
    BrandDto brandDto = BrandDto(
      Id: '1234',
      name: "fake name",
      slug: "fake-slug",
      image: "https://example.com/image.png",
    );
    Brand result = brandDto.toBrand();
    expect(result.Id, equals(brandDto.Id));
    expect(result.name, equals(brandDto.name));
    expect(result.slug, equals(brandDto.slug));
    expect(result.image, equals(brandDto.image));
  });
}