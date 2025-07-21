import 'package:c3_offline/api/client/api_result.dart';
import 'package:c3_offline/data/repositories/BrandsRepoImpl.dart';
import 'package:c3_offline/domain/model/brand.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:c3_offline/data/dataSource/BrandsRemoteDataSource.dart';
import 'package:mockito/mockito.dart';

import 'BrandsRepoImpl_test.mocks.dart';
@GenerateMocks([BrandsRemoteDataSource])
void main() {
  test('when call getBrands it should getBrands from dataSource with correct parameters', ()async{

    // Arrange
    BrandsRemoteDataSource brandsRemoteDataSource = MockBrandsRemoteDataSource();
    BrandsRepoImpl brandsRepo = BrandsRepoImpl(brandsRemoteDataSource);
    var limit = 10;
    var page = 1;
    var keyword = 'test';
    var expectedBrands = [
      Brand(
        Id: "1",
        name: 'Brand 1',
        image: 'https://example.com/brand1.png',
        slug: 'slug1'
      ),
      Brand(
        Id: "2",
        name: 'Brand 2',
        image: 'https://example.com/brand2.png',
        slug: 'slug2'
      ),
    ];
    var expectedResult = Success(expectedBrands);

    provideDummy<Result<List<Brand>>>(expectedResult);

    when(brandsRemoteDataSource.getBrands(
      limit: limit,
      page: page,
      keyword: keyword
    )).thenAnswer((_) async => expectedResult);


    // Act

    var response = await brandsRepo.getBrands(limit: limit, page: page, keyword: keyword);

    // Assert

    verify(brandsRemoteDataSource.getBrands(
      limit: limit,
      page: page,
      keyword: keyword
    )).called(1);

    expect(response, isA<Success<List<Brand>>>());
    response as Success<List<Brand>>;
    expect(response.data,equals(expectedBrands));
  });
}