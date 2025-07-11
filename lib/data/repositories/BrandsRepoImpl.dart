import 'package:c3_offline/data/dataSource/BrandsRemoteDataSource.dart';
import 'package:c3_offline/domain/model/brand.dart';
import 'package:c3_offline/domain/respositories/BrandsRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsRepoImpl implements Brandsrepo{

  BrandsRemoteDataSource _remoteDataSource;

  BrandsRepoImpl(this._remoteDataSource);

  @override
  Future<List<Brand>> getBrands(
      {
        int limit = 10,
        int page = 1,
        String? keyword
      }
      ) {
    return _remoteDataSource.getBrands(
      limit: limit,
      page: page,
      keyword: keyword
    );
  }



}