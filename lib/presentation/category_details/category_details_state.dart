part of 'category_details_cubit.dart';

sealed class CategoryDetailsState extends Equatable {
  const CategoryDetailsState();
}

final class CategoryDetailsInitial extends CategoryDetailsState {
  @override
  List<Object> get props => [];
}
final class CategoryDetailsSuccess extends CategoryDetailsState {
  Category category;
  List<Product> products;
  CategoryDetailsSuccess(this.category, this.products);
  @override
  List<Object> get props => [
    category,
    products,
  ];
}
