import 'package:bloc_test/bloc_test.dart';
import 'package:c3_offline/api/client/api_result.dart';
import 'package:c3_offline/domain/model/category.dart';
import 'package:c3_offline/domain/model/product.dart';
import 'package:c3_offline/presentation/home/home_viewModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:c3_offline/domain/usecase/GetCategoriesUseCase.dart';
import 'package:c3_offline/domain/usecase/GetMostSellingProducts.dart';
import 'package:c3_offline/domain/usecase/GetNewArrivalProducts.dart';
import 'package:c3_offline/domain/usecase/GetProductsByCategoryId.dart';
import 'package:mockito/mockito.dart';

import 'home_viewModel_test.mocks.dart';

@GenerateMocks([
  GetCategoriesUseCase,
  GetProductsByCategoryIdUseCase,
  GetNewArrivalsUseCase,
  GetMostSellingProducts
])
void main() {
 group("Home View Model Test", () {



   late HomeViewModel homeViewModel ;
   late HomeState state ;

    late GetCategoriesUseCase getCategoriesUseCase =MockGetCategoriesUseCase();
    late GetProductsByCategoryIdUseCase getProductsByCategoryIdUseCase = MockGetProductsByCategoryIdUseCase();
    late GetNewArrivalsUseCase getNewArrivalsUseCase =MockGetNewArrivalsUseCase();
    late GetMostSellingProducts getMostSellingProducts = MockGetMostSellingProducts();

    List<Category> categories = [
      Category(
          Id: "1",
          name: "Category 1",
          image: "https://example.com/category1.png",
          slug: "category-1"
      ),
      Category(
          Id: "2",
          name: "Category 2",
          image: "https://example.com/category2.png",
          slug: "category-2"
      ),
    ];
    List <Product> products = [
      Product(
          id: "1",
          title: "Product 1",
          imageCover: "https://example.com/product1.png",
          slug: "product-1"
      ),
      Product(
          id: "2",
          title: "Product 2",
          imageCover: "https://example.com/product2.png",
          slug: "product-2"
      ),
    ];;


   Result<List<Category>> categoriesResponse = Success<List<Category>>(categories);

   Result<List<Product>> productsSuccessResponse = Success<List<Product>>(
       products
   );
   Result<List<Product>> productsFailureResponse = Failure("Failed to load categories",exception: Exception("Network Error"));

   provideDummy<Result<List<Category>>>(categoriesResponse);
   provideDummy<Result<List<Product>>>(productsSuccessResponse);
   Result<List<Category>> categoriesFailureResponse = Failure("Failed to load categories",exception: Exception("Network Error"));

   setUpAll((){
     when(getCategoriesUseCase.invoke())
         .thenAnswer((_) async => categoriesResponse);

     when(getNewArrivalsUseCase.invoke())
         .thenAnswer((_) async => productsSuccessResponse);


     when(getMostSellingProducts.invoke())
         .thenAnswer((_) async => productsSuccessResponse);
   });
   // runs before every test
   setUp((){
     homeViewModel = HomeViewModel(
         getCategoriesUseCase,
         getProductsByCategoryIdUseCase,
         getNewArrivalsUseCase,
         getMostSellingProducts);

     state = HomeState();
   });



   blocTest<HomeViewModel, HomeState>("call doIntent with HomeRefreshIntent"
       "then load all Categories",
       build: ()=> homeViewModel,
       act: (homeViewModel) {
         homeViewModel.doIntent(HomeRefreshIntent());
       },
       expect: () => [
         state.copyWith(
           categories: state.categoriesState.copyWith(
             isLoading: true,
           ),
           newArrivals: state.newArrivalsState.copyWith(
             isLoading: true,
           ),
           mostSelling: state.mostSellingState.copyWith(
             isLoading: true,
           ),
         ),

         state.copyWith(
           categories: state.categoriesState.copyWith(
             isLoading: false,
             data: categories
           )
         ),
         state.copyWith(
             mostSelling: state.mostSellingState.copyWith(
                 isLoading: false,
                 data: products
             )
         ),

      state.copyWith(newArrivals: state.newArrivalsState.copyWith(
              isLoading: false,
              data: products
            )
          ),


       ],
       verify: (viewModel) {
         // verify 3 uses cases are called
         verify(getCategoriesUseCase.invoke()).called(1);
         verify(getNewArrivalsUseCase.invoke()).called(1);
         verify(getMostSellingProducts.invoke()).called(1);
       }
   );

   blocTest<HomeViewModel, HomeState>("call doIntent with HomeRefreshIntent"
       "and categories fails load then fail state for Categories",
       build: () => homeViewModel,
       act: (homeViewModel) {

     provideDummy<Result<List<Category>>>(categoriesFailureResponse);

         when(getCategoriesUseCase.invoke())
            .thenAnswer((_) async => categoriesFailureResponse);

     when(getNewArrivalsUseCase.invoke())
         .thenAnswer((_) async => productsSuccessResponse);


     when(getMostSellingProducts.invoke())
         .thenAnswer((_) async => productsSuccessResponse);
         homeViewModel.doIntent(HomeRefreshIntent());
       },
       expect: () => [
         state.copyWith(
           categories: state.categoriesState.copyWith(
             isLoading: true,
           ),
           newArrivals: state.newArrivalsState.copyWith(
             isLoading: true,
           ),
           mostSelling: state.mostSellingState.copyWith(
             isLoading: true,
           ),
         ),

         state.copyWith(
           categories: state.categoriesState.copyWith(
             isLoading: false,
             data: null,
             failure: categoriesFailureResponse as Failure
           )
         ),

         state.copyWith(
             mostSelling: state.mostSellingState.copyWith(
                 isLoading: false,
                 data: products
             )
         ),

      state.copyWith(newArrivals: state.newArrivalsState.copyWith(
              isLoading: false,
              data: products
            )
          ),


       ],
       verify: (viewModel) {
         // verify 3 uses cases are called
         verify(getCategoriesUseCase.invoke()).called(1);
         verify(getNewArrivalsUseCase.invoke()).called(1);
         verify(getMostSellingProducts.invoke()).called(1);
       }
   );


   blocTest<HomeViewModel, HomeState>("call doIntent with HomeRefreshIntent"
       "and mostSelling fails load then fail state for Most Selling",
       build: () => homeViewModel,
       act: (homeViewModel) {

     provideDummy<Result<List<Product>>>(productsFailureResponse);

     when(getCategoriesUseCase.invoke())
         .thenAnswer((_) async => categoriesResponse);

     when(getNewArrivalsUseCase.invoke())
         .thenAnswer((_) async => productsSuccessResponse);


     when(getMostSellingProducts.invoke())
         .thenAnswer((_) async => productsFailureResponse);

         homeViewModel.doIntent(HomeRefreshIntent());
       },
       expect: () => [
         state.copyWith(
           categories: state.categoriesState.copyWith(
             isLoading: true,
           ),
           newArrivals: state.newArrivalsState.copyWith(
             isLoading: true,
           ),
           mostSelling: state.mostSellingState.copyWith(
             isLoading: true,
           ),
         ),

         state.copyWith(
           categories: state.categoriesState.copyWith(
             isLoading: false,
             data: categories,
           )
         ),

         state.copyWith(
             mostSelling: state.mostSellingState.copyWith(
                 isLoading: false,
                 data: null,
                 failure: productsFailureResponse as Failure
             )
         ),

      state.copyWith(newArrivals: state.newArrivalsState.copyWith(
              isLoading: false,
              data: products,
            )
          ),


       ],
       verify: (viewModel) {
         // verify 3 uses cases are called
         verify(getCategoriesUseCase.invoke()).called(1);
         verify(getNewArrivalsUseCase.invoke()).called(1);
         verify(getMostSellingProducts.invoke()).called(1);
       }
   );


   blocTest<HomeViewModel, HomeState>("call doIntent with HomeRefreshIntent"
       "and newArrivals fails load then fail state for new Arrivals",
       build: () => homeViewModel,
       act: (homeViewModel) {

     provideDummy<Result<List<Product>>>(productsFailureResponse);

     when(getCategoriesUseCase.invoke())
         .thenAnswer((_) async => categoriesResponse);


     when(getNewArrivalsUseCase.invoke())
         .thenAnswer((_) async => productsFailureResponse);

     when(getMostSellingProducts.invoke())
         .thenAnswer((_) async => productsSuccessResponse);

     homeViewModel.doIntent(HomeRefreshIntent());

       },
       expect: () => [
         state.copyWith(
           categories: state.categoriesState.copyWith(
             isLoading: true,
           ),
           newArrivals: state.newArrivalsState.copyWith(
             isLoading: true,
           ),
           mostSelling: state.mostSellingState.copyWith(
             isLoading: true,
           ),
         ),

         state.copyWith(
           categories: state.categoriesState.copyWith(
             isLoading: false,
             data: categories,
           )
         ),

         state.copyWith(
             mostSelling: state.mostSellingState.copyWith(
                 isLoading: false,
                 data: products,
             )
         ),

      state.copyWith(newArrivals: state.newArrivalsState.copyWith(
              isLoading: false,
              data: null,
              failure: productsFailureResponse as Failure
            )
          ),


       ],
       verify: (viewModel) {
         // verify 3 uses cases are called
         verify(getCategoriesUseCase.invoke()).called(1);
         verify(getNewArrivalsUseCase.invoke()).called(1);
         verify(getMostSellingProducts.invoke()).called(1);
       }
   );




   blocTest<HomeViewModel, HomeState>("call doIntent with HomeRefreshIntent"
       "and newArrivals fails load then fail state for new Arrivals",
       build: () => homeViewModel,
       act: (homeViewModel) {

     homeViewModel.doIntent(OnCategoryClickIntent(Category(
         Id: "1",
         name: "Category 1",
         image: "https://example.com/category1.png",
         slug: "category-1")));

       },
       expect: () => [

       ],
   );



 });
}
