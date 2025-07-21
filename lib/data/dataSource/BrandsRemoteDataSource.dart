import 'package:c3_offline/api/client/api_result.dart';
import 'package:c3_offline/domain/model/brand.dart';

abstract class BrandsRemoteDataSource{
  Future<Result<List<Brand>>> getBrands(
      {
        int limit = 10,
        int page = 1,
        String? keyword
      }
      );
}