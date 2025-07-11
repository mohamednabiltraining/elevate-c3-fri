import 'package:c3_offline/api/client/ApiClient.dart';
import 'package:c3_offline/data/dataSource/BrandsRemoteDataSource.dart';
import 'package:c3_offline/domain/model/brand.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRemoteDataSource)
class BrandsRemoteDataSourceImpl implements BrandsRemoteDataSource {
  ApiClient _client;
  BrandsRemoteDataSourceImpl(this._client);

  @override
  Future<List<Brand>> getBrands({
    int limit = 10,
    int page = 1,
    String? keyword
  }) async {
    var response = await _client.getBrands(
      limit: limit,
      page: page,
      keyword: keyword
    );
    return response.data?.map((dto) => dto.toBrand()).toList() ?? [];
  }
}
