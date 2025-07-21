import 'package:c3_offline/api/client/ApiClient.dart';
import 'package:c3_offline/api/client/api_result.dart';
import 'package:c3_offline/data/dataSource/ProductsRemoteDataSource.dart';
import 'package:c3_offline/domain/model/SortFields.dart';
import 'package:c3_offline/domain/model/product.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource{

  ApiClient _client;

  ProductsRemoteDataSourceImpl(this._client);

  @override
  Future<Result<List<Product>>> getProducts(
      {
        int limit = 10,
        int page = 1,
        String? keyword,
        List<String>? categories,
        SortFields? sortField,
      }
      )async{
    return executeApi(() async {
      var response = await _client.getProducts(
        limit: limit,
        page: page,
        keyword: keyword,
        categories: categories,
        sortField: sortField
      );
      return response.data?.map((prodDto)=> prodDto.toProduct()).toList() ?? [];
    });
  }

}