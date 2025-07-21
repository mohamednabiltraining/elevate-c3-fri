import 'package:c3_offline/api/client/api_result.dart';
import 'package:c3_offline/domain/model/category.dart';

abstract class Categoriesrepo{
  Future<Result<List<Category>>> getCategories({
    int limit = 10,
    int page = 1,
    String? keyword
  });
}