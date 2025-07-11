import 'package:c3_offline/domain/model/category.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<Category>> getCategories(
      {int limit = 10, int page = 1, String? keyword});
}
