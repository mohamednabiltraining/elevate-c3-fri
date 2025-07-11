import 'package:c3_offline/domain/model/SortFields.dart';
import 'package:c3_offline/domain/model/product.dart';

abstract class ProductsRemoteDataSource {
  Future<List<Product>> getProducts(
      {int limit = 10, int page = 1, String? keyword,
        List<String>? categories,
        SortFields? sortField,});
}
