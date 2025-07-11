import 'package:c3_offline/api/response/brands_response.dart';
import 'package:c3_offline/api/response/categories_response.dart';
import 'package:c3_offline/api/response/products_response.dart';
import 'package:c3_offline/domain/model/SortFields.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ApiClient.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;


  @GET("v1/products")
  Future<ProductsResponse> getProducts({
    @Query("limit")int limit = 10,
    @Query("page")int page = 1,
    @Query("keyword") String? keyword,
    @Query("category[in]") List<String>? categories,
    @Query("sort") SortFields? sortField,
  });

  @GET("v1/brands")
  Future<BrandsResponse> getBrands(
      {
        @Query("limit")int limit = 10,
        @Query("page")int page = 1,
        @Query("keyword") String? keyword
      }
      );

  @GET("v1/categories")
  Future<CategoriesResponse> getCategories({
  @Query("limit")int limit = 10,
  @Query("page")int page = 1,
  @Query("keyword") String? keyword
  });
}