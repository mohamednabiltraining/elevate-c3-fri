import 'package:c3_offline/domain/usecase/GetCategoriesUseCase.dart';
import 'package:c3_offline/domain/usecase/GetNewArrivalProducts.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel {
  GetCategoriesUseCase getCategoriesUseCase;
  HomeViewModel(this.getCategoriesUseCase);

  void getProducts()async{
    await getCategoriesUseCase.invoke();
  }

}