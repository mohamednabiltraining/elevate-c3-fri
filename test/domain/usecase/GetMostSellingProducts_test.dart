import 'package:c3_offline/api/client/api_result.dart';
import 'package:c3_offline/domain/model/SortFields.dart';
import 'package:c3_offline/domain/model/product.dart';
import 'package:c3_offline/domain/usecase/GetMostSellingProducts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:c3_offline/domain/respositories/ProductsRepo.dart';
import 'package:mockito/mockito.dart';

import 'GetMostSellingProducts_test.mocks.dart';

@GenerateMocks([ProductsRepo])
void main() {
  test(
    'when call GetMostSellingProducts it should get most selling products from Repo with correct parameters',
    () async {
      // Arrange
      var mockedProductsRepo = MockProductsRepo();
      GetMostSellingProducts useCase = GetMostSellingProducts(
        mockedProductsRepo,
      );
      var expectedProducts = [
        Product(
          id: "1",
          title: 'Product 1',
          imageCover: 'https://example.com/product1.png',
          slug: 'product-1',
        ),
        Product(
          id: "2",
          title: 'Product 2',
          imageCover: 'https://example.com/product2.png',
          slug: 'product-2',
        ),
      ];
      var expectedResult = Success(expectedProducts);
      var limit = 20;
      var page = 2;

      provideDummy<Result<List<Product>>>(expectedResult);

      when(
        mockedProductsRepo.getProducts(
          limit: limit,
          page: page,
          sortField: SortFields.mostSelling,
        ),
      ).thenAnswer((_) async => expectedResult);
      // Act
      var result = await useCase.invoke(limit: limit, page: page);
      // Assert
      verify(
        mockedProductsRepo.getProducts(
          limit: limit,
          page: page,
          sortField: SortFields.mostSelling,
        ),
      ).called(1);

      expect(result, isA<Success<List<Product>>>());
      result as Success<List<Product>>;
      expect(result.data, equals(expectedProducts));
    },
  );
}
