import 'package:c3_offline/api/client/ApiClient.dart';
import 'package:c3_offline/data/dataSource/CategoriesRemoteDataSource.dart';
import 'package:c3_offline/domain/model/category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  ApiClient _client;
  CategoriesRemoteDataSourceImpl(this._client);

  @override
  Future<List<Category>> getCategories(
      {
        int limit = 10,
        int page = 1,
        String? keyword
      }
      ) async {
    var response = await _client.getCategories(
      limit: limit,
      page: page,
      keyword: keyword
    );
    return response.data?.map((dto) => dto.toCategory()).toList() ?? [];
  }
}
