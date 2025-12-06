import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/features/browse/data/models/category_model.dart';
import 'package:waster/features/browse/domain/entity/category_entity.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_tab_bar_button.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.titles});
  final List<CategoryEntity> titles;
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int currIndex = 0;

  @override
  void initState() {
    int totalCount = widget.titles.fold(0, (sum, item) => sum + item.count);
    widget.titles.insert(0, CategoryModel(category: 'All', count: totalCount));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.titles.length,
        itemBuilder: (context, index) {
          return CustomTabBarButton(
            title:
                '${widget.titles[index].category} (${widget.titles[index].count})',
            textColor: currIndex == index
                ? Theme.of(context).extension<AppColors>()!.whiteColor
                : Theme.of(context).extension<AppColors>()!.blackTextColor,
            color: currIndex == index
                ? Theme.of(context).extension<AppColors>()!.primaryColor
                : Theme.of(context).extension<AppColors>()!.scaffoldColor,
            onPressed: () {
              setState(() {
                currIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
