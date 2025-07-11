import 'package:bloc/bloc.dart';
import 'package:c3_offline/domain/model/category.dart';
import 'package:c3_offline/domain/model/product.dart';
import 'package:equatable/equatable.dart';

part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit() : super(CategoryDetailsInitial());
}
