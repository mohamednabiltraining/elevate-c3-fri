import 'package:bloc/bloc.dart';

 class HomeIntent{}
 class HomeState{}
 class HomeEvent {}

abstract class HomeViewModelContract<HomeState> extends Cubit<HomeState> {

  abstract Stream<HomeEvent> events;

  HomeViewModelContract(super.initialState);

  void doIntent(HomeIntent intent);
}