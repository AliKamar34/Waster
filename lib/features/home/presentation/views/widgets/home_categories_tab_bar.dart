import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/features/browse/data/models/category_model.dart';
import 'package:waster/features/browse/domain/entity/category_entity.dart';
import 'package:waster/features/home/presentation/manager/feed_cubit/feed_cubit.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_tab_bar_button.dart';

class HomeCategoriesTabBar extends StatefulWidget {
  const HomeCategoriesTabBar({super.key, required this.categories});
  final List<CategoryEntity> categories;

  @override
  State<HomeCategoriesTabBar> createState() => _HomeCategoriesTabBarState();
}

class _HomeCategoriesTabBarState extends State<HomeCategoriesTabBar> {
  int currIndex = 0;
  late List<CategoryEntity> allCategories;

  @override
  void initState() {
    super.initState();

    int totalCount = widget.categories.fold(0, (sum, item) => sum + item.count);

    allCategories = [
      CategoryModel(category: 'All', count: totalCount),
      ...widget.categories,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allCategories.length,
        itemBuilder: (context, index) {
          final isSelected = currIndex == index;
          final category = allCategories[index];

          return CustomTabBarButton(
            title: '${category.category} (${category.count})',
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

              final selectedCategory = index == 0 ? '' : category.category;
              context.read<FeedPostsCubit>().changeCategoryFilter(
                selectedCategory,
              );
            },
          );
        },
      ),
    );
  }
}
