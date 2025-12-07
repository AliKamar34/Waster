import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/features/browse/domain/entity/category_entity.dart';
import 'package:waster/features/browse/presentation/manager/search_cubit/search_cubit.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_tab_bar_button.dart';

class SearchCategoriesTabBar extends StatefulWidget {
  const SearchCategoriesTabBar({super.key, required this.categories});
  final List<CategoryEntity> categories;

  @override
  State<SearchCategoriesTabBar> createState() => _SearchCategoriesTabBarState();
}

class _SearchCategoriesTabBarState extends State<SearchCategoriesTabBar> {
  int currIndex = 0;
  late List<String> categoryNames;

  @override
  void initState() {
    super.initState();

    categoryNames = ['All', ...widget.categories.map((c) => c.category)];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryNames.length,
        itemBuilder: (context, index) {
          final isSelected = currIndex == index;
          final categoryName = categoryNames[index];
          return CustomTabBarButton(
            title: categoryName,
            textColor: isSelected
                ? Theme.of(context).extension<AppColors>()!.whiteColor
                : Theme.of(context).extension<AppColors>()!.blackTextColor,
            color: isSelected
                ? Theme.of(context).extension<AppColors>()!.primaryColor
                : Theme.of(context).extension<AppColors>()!.scaffoldColor,
            onPressed: () {
              setState(() {
                currIndex = index;
              });
              final selectedCategory = index == 0 ? '' : categoryName;
              context.read<SearchPostsCubit>().changeCategoryInSearch(
                selectedCategory,
              );
            },
          );
        },
      ),
    );
  }
}
