// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'api/client/ApiClient.dart' as _i803;
import 'api/client/ApiModule.dart' as _i148;
import 'api/dataSource/BrandsRemoteDataSourceImpl.dart' as _i291;
import 'api/dataSource/CategoriesRemoteDataSourceImpl.dart' as _i35;
import 'api/dataSource/ProductsRemoteDataSourceImpl.dart' as _i196;
import 'data/dataSource/BrandsRemoteDataSource.dart' as _i1000;
import 'data/dataSource/CategoriesRemoteDataSource.dart' as _i903;
import 'data/dataSource/ProductsRemoteDataSource.dart' as _i581;
import 'data/repositories/BrandsRepoImpl.dart' as _i116;
import 'data/repositories/CategoriesRepoImpl.dart' as _i455;
import 'data/repositories/ProductsRepoImpl.dart' as _i952;
import 'domain/respositories/CategoriesRepo.dart' as _i90;
import 'domain/respositories/ProductsRepo.dart' as _i583;
import 'domain/usecase/GetCategoriesUseCase.dart' as _i517;
import 'domain/usecase/GetMostSellingProducts.dart' as _i721;
import 'domain/usecase/GetNewArrivalProducts.dart' as _i712;
import 'domain/usecase/GetProductsByCategoryId.dart' as _i700;
import 'presentation/home/home_viewModel.dart' as _i964;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiModule = _$ApiModule();
    gh.singleton<_i361.Dio>(() => apiModule.provideDio());
    gh.factory<_i803.ApiClient>(() => _i803.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i581.ProductsRemoteDataSource>(
        () => _i196.ProductsRemoteDataSourceImpl(gh<_i803.ApiClient>()));
    gh.factory<_i903.CategoriesRemoteDataSource>(
        () => _i35.CategoriesRemoteDataSourceImpl(gh<_i803.ApiClient>()));
    gh.factory<_i1000.BrandsRemoteDataSource>(
        () => _i291.BrandsRemoteDataSourceImpl(gh<_i803.ApiClient>()));
    gh.factory<_i116.BrandsRepoImpl>(
        () => _i116.BrandsRepoImpl(gh<_i1000.BrandsRemoteDataSource>()));
    gh.factory<_i583.ProductsRepo>(
        () => _i952.ProductsRepoImpl(gh<_i581.ProductsRemoteDataSource>()));
    gh.factory<_i90.Categoriesrepo>(
        () => _i455.CategoriesRepoImpl(gh<_i903.CategoriesRemoteDataSource>()));
    gh.factory<_i517.GetCategoriesUseCase>(
        () => _i517.GetCategoriesUseCase(gh<_i90.Categoriesrepo>()));
    gh.factory<_i712.GetNewArrivalsUseCase>(
        () => _i712.GetNewArrivalsUseCase(gh<_i583.ProductsRepo>()));
    gh.factory<_i700.GetProductsByCategoryIdUseCase>(
        () => _i700.GetProductsByCategoryIdUseCase(gh<_i583.ProductsRepo>()));
    gh.factory<_i721.GetMostSellingProducts>(
        () => _i721.GetMostSellingProducts(gh<_i583.ProductsRepo>()));
    gh.factory<_i964.HomeViewModel>(() => _i964.HomeViewModel(
          gh<_i517.GetCategoriesUseCase>(),
          gh<_i700.GetProductsByCategoryIdUseCase>(),
          gh<_i712.GetNewArrivalsUseCase>(),
          gh<_i721.GetMostSellingProducts>(),
        ));
    return this;
  }
}

class _$ApiModule extends _i148.ApiModule {}
