import 'package:c3_offline/api/client/api_result.dart';
import 'package:c3_offline/domain/model/SortFields.dart';
import 'package:c3_offline/domain/model/product.dart';
import 'package:c3_offline/domain/respositories/ProductsRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMostSellingProducts {
  ProductsRepo _repo;

  GetMostSellingProducts(this._repo);

  Future<Result<List<Product>>> invoke({
    int limit = 10,
    int page = 1,
  }){
    return _repo.getProducts(
      limit: limit,
      page: page,
      sortField: SortFields.mostSelling
    );
  }
}