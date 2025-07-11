import 'package:bloc/bloc.dart';
import 'package:c3_offline/di.dart';
import 'package:c3_offline/presentation/common/HorizontalCategoriesGrid.dart';
import 'package:c3_offline/presentation/common/HorizontalProductsView.dart';
import 'package:c3_offline/presentation/home/home_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    homeViewModel.add(HomeRefreshEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: BlocConsumer<HomeViewModel,HomeState>(
        bloc: homeViewModel,
        builder: (context, state) {
          switch(state){
            case HomeSuccessState():{
              return _buildSuccessState(state);
            }
            case HomeErrorState():{
              return _buildErrorState(state);
            }
            case HomeInitialState():{
              return _buildLoadingState(state);
            }
            default:{
              throw Exception("Unknown state");
            }
          }
        },
        listener: (context, state) {
          if(state is ShowDialog){
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: Text(state.message),
              );
            });
          }
        },
        listenWhen: (previous, current) {
          if(current is ShowDialog){
            return true;
          }
          return false;
        },
        buildWhen: (previous, current) {
         if(current is ShowDialog){
           return false;
         }
         return true;
        },


      ),
    );
  }

  Widget _buildSuccessState(HomeSuccessState state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Visibility(
            visible: state.categories?.isNotEmpty == true,
            child: Container(
              height: 220,
              child: HorizontalCategoriesGrid(
                categories: state.categories ??[]
              ),
            ),
          ),
          Visibility(
            visible: state.newArrivals?.isNotEmpty == true,
            child: Container(
              height: 220,
              child: HorizontalProductsView(
                products: state.newArrivals??[]
              ),
            ),
          ),
          Container(
            height: 220,
            child: Visibility(
              visible: state.mostSelling?.isNotEmpty == true,
              child: HorizontalProductsView(
                products: state.mostSelling??[]
              ),
            ),
          )
          ]
      ),
    );
  }

  Widget _buildErrorState(HomeErrorState state) {
    return Text(state.message ?? "Something went Wrong");
  }

  Widget _buildLoadingState(HomeInitialState state) {
    return Center(child: CircularProgressIndicator());
  }
}
