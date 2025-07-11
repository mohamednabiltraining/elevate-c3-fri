import 'package:c3_offline/domain/model/brand.dart';
import 'package:c3_offline/domain/model/product.dart';

abstract class BrandsRemoteDataSource{
  Future<List<Brand>> getBrands(
      {
        int limit = 10,
        int page = 1,
        String? keyword
      }
      );
}