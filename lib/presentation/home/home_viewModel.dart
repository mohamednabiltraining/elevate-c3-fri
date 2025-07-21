import 'package:bloc/bloc.dart';
import 'package:c3_offline/api/client/api_result.dart';
import 'package:c3_offline/domain/model/category.dart';
import 'package:c3_offline/domain/model/product.dart';
import 'package:c3_offline/domain/usecase/GetCategoriesUseCase.dart';
import 'package:c3_offline/domain/usecase/GetMostSellingProducts.dart';
import 'package:c3_offline/domain/usecase/GetNewArrivalProducts.dart';
import 'package:c3_offline/domain/usecase/GetProductsByCategoryId.dart';
import 'package:c3_offline/presentation/home/HomeComponentState.dart';
import 'package:c3_offline/presentation/home/HomeContract.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetProductsByCategoryIdUseCase getProductsByCategoryIdUseCase;
  GetNewArrivalsUseCase getNewArrivalsUseCase;
  GetMostSellingProducts getMostSellingProducts;
  HomeSuccessState state = HomeSuccessState();

  HomeViewModel(
    this.getCategoriesUseCase,
    this.getProductsByCategoryIdUseCase,
    this.getNewArrivalsUseCase,
    this.getMostSellingProducts,
  ) : super(HomeState());

  // @override
  // ValueNotifier<BaseAction?> events = ValueNotifier<BaseAction?>(null); // Implement your event stream if needed
  //
  doIntent(HomeIntent intent) {
    switch (intent) {
      case HomeRefreshIntent():
        _loadHome();
        break;
      case OnProductClickIntent():
      // Handle product click
        break;
      case OnCategoryClickIntent():
      // Handle category click
        break;
    }
  }

  Future<void> _loadHome() async {

    // events.value = NavigationAction("home");

    _loadCategories();
    _loadMostSelling();
    _loadNewArrivals();
  }

  Future<void> _loadCategories() async {
    emit(state.copyWith(
        categories: state.categoriesState.copyWith(
            isLoading: true
        )
    ));
    var categories = await getCategoriesUseCase.invoke();

    switch (categories) {
      case Success():
        {
          emit(state.copyWith(
              categories: state.categoriesState.copyWith(
                  isLoading: false,
                  data: categories.data
              )));
        }
      case Failure():
        {
          emit(state.copyWith(
              categories: state.categoriesState.copyWith(
                isLoading: false,
                failure: categories,
              )
          ));
        }
    }
  }

  Future<void> _loadNewArrivals() async {
    emit(state.copyWith(
      newArrivals: state.newArrivalsState.copyWith(
        isLoading: true
      )
    ));
    var newArrivals = await getNewArrivalsUseCase.invoke();
    switch(newArrivals){
      case Success():{
        emit(state.copyWith(
            newArrivals: state.newArrivalsState.copyWith(
              isLoading: false,
              data: newArrivals.data,
            )));
      }
      case Failure():
        emit(state.copyWith(
          newArrivals: state.newArrivalsState.copyWith(
            isLoading: false,
            failure: newArrivals,
          )
        ));
    }
  }

  Future<void> _loadMostSelling() async {
    emit(state.copyWith(
      mostSelling: state.mostSellingState.copyWith(
        isLoading: true
      )
    ));
    var result = await getMostSellingProducts.invoke();

    switch(result){
      case Success():{
        emit(state.copyWith(
            mostSelling: state.mostSellingState.copyWith(
              isLoading: false,
              data: result.data,
            )));
      }
      case Failure():
        emit(state.copyWith(
          mostSelling: state.mostSellingState.copyWith(
            isLoading: false,
            failure: result,
          )

        ));
        return;
    }
  }
}

class HomeSuccessState extends HomeState{
  HomeComponentState<List<Category>?> categoriesState;
  HomeComponentState<List<Product>?> newArrivalsState;
  HomeComponentState<List<Product>?> mostSellingState;

  HomeSuccessState({
    this.categoriesState = const HomeComponentState<List<Category>?>(),
    this.newArrivalsState = const HomeComponentState<List<Product>?>(),
    this.mostSellingState = const HomeComponentState<List<Product>?>(),
  });

  HomeSuccessState copyWith({
    HomeComponentState<List<Category>?>? categories,
    HomeComponentState<List<Product>?>? newArrivals,
    HomeComponentState<List<Product>?>? mostSelling,
  }) {
    return HomeSuccessState(
      categoriesState: categories ?? this.categoriesState,
      newArrivalsState: newArrivals ?? this.newArrivalsState,
      mostSellingState: mostSelling ?? this.mostSellingState,
    );
  }
}

class HomeRefreshIntent extends HomeIntent {}

class OnProductClickIntent extends HomeIntent {
  final Product product;
  OnProductClickIntent(this.product);
}

class OnCategoryClickIntent extends HomeIntent {
  final Category category;
  OnCategoryClickIntent(this.category);
}
