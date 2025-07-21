import 'package:c3_offline/api/client/api_result.dart';
import 'package:c3_offline/api/dataSource/BrandsRemoteDataSourceImpl.dart';
import 'package:c3_offline/api/response/brands_response.dart';
import 'package:c3_offline/api/response/model/brand.dart';
import 'package:c3_offline/domain/model/brand.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:c3_offline/api/client/ApiClient.dart';
import 'package:mockito/mockito.dart';

import 'BrandsRemoteDataSourceImpl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  test('verify when call getBrands it should getBrands from Api with correct parameters', ()async {
    // call to function verification
    // Mock the ApiClient
    // Arrange
    MockApiClient mockApiClient = MockApiClient();
    BrandsRemoteDataSourceImpl remoteDataSource = BrandsRemoteDataSourceImpl(mockApiClient);
    var limit = 20;
    var page = 2;
    var keyword = 'test';

    var expectedResponse = BrandsResponse(
        data: [
          BrandDto(
              Id: '1',
              name: 'Brand 1',
              slug: 'brand-1',
              image: 'image1.png'
          ),
          BrandDto(
              Id: '2',
              name: 'Brand 2',
              slug: 'brand-2',
              image: 'image2.png'
          )
        ]
    );
    when(mockApiClient.getBrands(
      limit: limit,
      page: page,
      keyword: keyword
    )).thenAnswer((_) async => expectedResponse);

    // Act

    var result = await remoteDataSource.getBrands(
      limit: limit,
      page: page,
      keyword: keyword
    );

    // Assert
    verify(mockApiClient.getBrands(
        limit: limit,
        page: page,
        keyword: keyword
    )).called(1);


    expect(result, isA<Success>());
    result as Success<List<Brand>>;
    expect(result.data.length, equals(expectedResponse.data?.length));
  });

}