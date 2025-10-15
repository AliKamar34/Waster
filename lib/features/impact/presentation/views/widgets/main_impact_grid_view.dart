import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/impact/presentation/views/widgets/custom_impact_grid_view.dart';

class MainImpactGridView extends StatelessWidget {
  const MainImpactGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'count': '23',
        'color': Theme.of(context).extension<AppColors>()!.primaryColor,
        'title': 'Total Donations',
        'unit': 'items',
      },
      {
        'count': '156',
        'color': Theme.of(context).extension<AppColors>()!.orangeColor,
        'title': 'Meals Served',
        'unit': 'meals',
      },
      {
        'count': '342',
        'color': Theme.of(context).extension<AppColors>()!.blueColor,
        'title': 'Food Rescued',
        'unit': 'lbs',
      },
      {
        'count': '89',
        'color': Theme.of(context).extension<AppColors>()!.primaryColor,
        'title': 'CO₂ Saved',
        'unit': 'kg',
      },
    ];
    return CustomImpactGridView(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CustomContainer(
          child: Column(
            spacing: 24,
            children: [
              Text(
                items[index]['count'],
                style: AppTextStyle.styleBold24(
                  context,
                ).copyWith(color: items[index]['color']),
              ),
              Text(
                items[index]['title'],
                style: AppTextStyle.styleRegular14(context),
              ),
              Text(
                items[index]['unit'],
                style: AppTextStyle.styleRegular14(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
