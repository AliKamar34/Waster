import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:waster/features/browse/domain/entity/category_entity.dart';
import 'package:waster/features/browse/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:waster/features/browse/presentation/views/widgets/search_categories_tab_bar.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          return SearchCategoriesTabBar(
            categories: state.categories.categories,
          );
        } else if (state is CategoriesLoading) {
          return Skeletonizer(
            child: SearchCategoriesTabBar(
              categories: List.generate(
                3,
                (index) => const CategoryEntity(category: 'category', count: 2),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
