import 'package:c3_offline/domain/model/category.dart';
import 'package:c3_offline/domain/respositories/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  Categoriesrepo _repo;
  GetCategoriesUseCase(this._repo);

  Future<List<Category>> invoke({
    int limit = 10,
    int page = 1,
    String? keyword
  }){
    return _repo.getCategories(
      limit: limit,
      page: page,
      keyword: keyword
    );
  }
}