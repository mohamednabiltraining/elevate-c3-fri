import 'package:c3_offline/di.dart';
import 'package:c3_offline/presentation/home_viewModel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    homeViewModel.getProducts();
    return const Placeholder();
  }
}
