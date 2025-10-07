import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_tab_bar_button.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.titles});
  final List<String> titles;
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.titles.length,
        itemBuilder: (context, index) {
          return CustomTabBarButton(
            title: widget.titles[index],
            textColor: currIndex == index
                ? AppColors.whiteColor
                : AppColors.blackTextColor,
            color: currIndex == index
                ? AppColors.primaryColor
                : AppColors.scaffoldColor,
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
