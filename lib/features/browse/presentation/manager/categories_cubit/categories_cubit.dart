import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/usecases/use_cases.dart';
import 'package:waster/features/browse/data/models/category_model.dart';
import 'package:waster/features/browse/domain/usecase/categories_use_case.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesUseCase categoriesUseCase;

  CategoriesCubit({required this.categoriesUseCase})
    : super(const CategoriesInitial());

  Future<void> loadCategories() async {
    if (state is CategoriesLoaded) return;

    emit(const CategoriesLoading());

    final result = await categoriesUseCase.call(NoParams());

    result.fold(
      (failure) => emit(CategoriesError(failure.message)),
      (categories) => emit(CategoriesLoaded(categories)),
    );
  }
}
