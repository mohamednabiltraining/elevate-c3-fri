import 'package:c3_offline/api/client/api_result.dart';
import 'package:c3_offline/data/dataSource/CategoriesRemoteDataSource.dart';
import 'package:c3_offline/domain/model/category.dart';
import 'package:c3_offline/domain/respositories/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Categoriesrepo)
class CategoriesRepoImpl implements Categoriesrepo{

  CategoriesRemoteDataSource _categoriesRemoteDataSource;

  CategoriesRepoImpl(this._categoriesRemoteDataSource);

  @override
  Future<Result<List<Category>>> getCategories({
    int limit = 10,
    int page = 1,
    String? keyword
  }) {
    return _categoriesRemoteDataSource.getCategories(
      limit: limit,
      page: page,
      keyword: keyword
    );
  }
}