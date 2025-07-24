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
    homeViewModel.doIntent(HomeRefreshIntent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: BlocBuilder<HomeViewModel,HomeState>(
        bloc: homeViewModel,
        builder: (context, state) {
          switch(state){
            case HomeState():{
              return _buildSuccessState(state);
            }
            default:{
              return Center(child: CircularProgressIndicator());
            }
          }
        },


      ),
    );
  }

  Widget _buildSuccessState(HomeState state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              height: 220,
              child: state.categoriesState.isLoading == false ?
              HorizontalCategoriesGrid(
                categories: state.categoriesState.data??[]
              ):
          Center(child: CircularProgressIndicator())
              )
          , SizedBox(
              height: 220,
              child: state.newArrivalsState.isLoading == false ?
              HorizontalProductsView(
                products: state.newArrivalsState.data??[]
              ):
          Center(child: CircularProgressIndicator())
              ),
          SizedBox(
              height: 220,
              child: state.mostSellingState.isLoading == false ?
              HorizontalProductsView(
                  products: state.mostSellingState.data??[]
              ):
              Center(child: CircularProgressIndicator())
          )

          ]
      ),
    );
  }
}
