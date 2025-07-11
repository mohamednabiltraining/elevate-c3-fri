import 'package:c3_offline/data/dataSource/ProductsRemoteDataSource.dart';
import 'package:c3_offline/domain/model/SortFields.dart';
import 'package:c3_offline/domain/model/product.dart';
import 'package:c3_offline/domain/respositories/ProductsRepo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo{
  ProductsRemoteDataSource _remoteDataSource;
  ProductsRepoImpl(this._remoteDataSource);

  @override
  Future<List<Product>> getProducts(
      {
        int limit = 10,
        int page = 1,
        String? keyword,
        List<String>? categories,
        SortFields? sortField,
      }
      ) {
    return _remoteDataSource.getProducts(
      limit: limit,
      page: page,
      keyword: keyword,
      categories: categories,
      sortField: sortField,
    );
  }
}