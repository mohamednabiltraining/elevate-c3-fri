import 'package:bloc/bloc.dart';
import 'package:c3_offline/domain/model/category.dart';
import 'package:c3_offline/domain/model/product.dart';
import 'package:c3_offline/domain/usecase/GetCategoriesUseCase.dart';
import 'package:c3_offline/domain/usecase/GetMostSellingProducts.dart';
import 'package:c3_offline/domain/usecase/GetNewArrivalProducts.dart';
import 'package:c3_offline/domain/usecase/GetProductsByCategoryId.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState>{
  GetCategoriesUseCase getCategoriesUseCase;
  GetProductsByCategoryIdUseCase getProductsByCategoryIdUseCase;
  GetNewArrivalsUseCase getNewArrivalsUseCase;
  GetMostSellingProducts getMostSellingProducts;

  HomeSuccessState state = HomeSuccessState();

  HomeViewModel(this.getCategoriesUseCase,
      this.getProductsByCategoryIdUseCase,
      this.getNewArrivalsUseCase,
      this.getMostSellingProducts,
      ):super(HomeInitialState()){
  }

  void doIntent(HomeIntent intent){
    switch(intent) {
      case HomeRefreshIntent():
        { _loadHome();
          break;
        }
        case OnProductClickIntent():{

        }
      case OnCategoryClickIntent():{

      }
    }
  }
  Future<void> _loadHome()async{
    try {
      var categories = await _loadCategories();
      var mostSelling = await _loadMostSelling();
      var newArrivals = await _loadNewArrivals();
      emit(state.copyWith(categories: categories,
          mostSelling: mostSelling,
      newArrivals: newArrivals));
    }catch(ex){
      emit(HomeErrorState(message: ex.toString()));
    }
  }

  Future<List<Category>> _loadCategories()async{
    var categories = await getCategoriesUseCase.invoke();
    return categories;
  }

  Future<List<Product>> _loadNewArrivals()async {
    var newArrivals = await getNewArrivalsUseCase.invoke();
    return newArrivals;

  }

  Future<List<Product>>  _loadMostSelling() async{
    var mostSelling = await getMostSellingProducts.invoke();
    return mostSelling;

  }

}

sealed class HomeState{}
class HomeInitialState extends HomeState{}
class HomeSuccessState extends HomeState{
  final List<Category>? categories;
  final List<Product>? newArrivals;
  final List<Product>? mostSelling;

  HomeSuccessState({
    this.categories,
    this.newArrivals,
    this.mostSelling,
  });
  HomeSuccessState copyWith({
    List<Category>? categories,
    List<Product>? newArrivals,
    List<Product>? mostSelling,
  }){
    return HomeSuccessState(
      categories: categories ?? this.categories,
      newArrivals: newArrivals ?? this.newArrivals,
      mostSelling: mostSelling ?? this.mostSelling,
    );
  }
}
class HomeErrorState extends HomeState{
  final String? message;
  HomeErrorState({this.message});
}
class ShowDialog extends HomeState{
  String message;
  ShowDialog(this.message);
}

sealed class HomeIntent{}
class HomeRefreshIntent extends HomeIntent{}
class OnProductClickIntent extends HomeIntent{
  final Product product;
  OnProductClickIntent(this.product);
}
class OnCategoryClickIntent extends HomeIntent{
  final Category category;
  OnCategoryClickIntent(this.category);
}