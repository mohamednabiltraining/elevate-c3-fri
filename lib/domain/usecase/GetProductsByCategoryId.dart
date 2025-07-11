import 'package:c3_offline/domain/model/category.dart';
import 'package:c3_offline/domain/model/product.dart';
import 'package:c3_offline/domain/respositories/CategoriesRepo.dart';
import 'package:c3_offline/domain/respositories/ProductsRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsByCategoryIdUseCase {
  ProductsRepo _repo;

  GetProductsByCategoryIdUseCase(this._repo);

  Future<List<Product>> invoke({
    int limit = 10,
    int page = 1,
    String? categoryId
  }){
    return _repo.getProducts(
      limit: limit,
      page: page,
      categories: [categoryId ?? ""],
    );
  }
}