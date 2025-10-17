import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
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
        'title': LocaleKeys.total_donations.tr(),
        'unit': LocaleKeys.items.tr(),
      },
      {
        'count': '156',
        'color': Theme.of(context).extension<AppColors>()!.orangeColor,
        'title': LocaleKeys.Meals_Served.tr(),
        'unit': LocaleKeys.meals.tr(),
      },
      {
        'count': '342',
        'color': Theme.of(context).extension<AppColors>()!.blueColor,
        'title': LocaleKeys.food_rescued.tr(),
        'unit': LocaleKeys.lbs.tr(),
      },
      {
        'count': '89',
        'color': Theme.of(context).extension<AppColors>()!.primaryColor,
        'title': LocaleKeys.co_saved.tr(),
        'unit': LocaleKeys.kg.tr(),
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
              Expanded(
                child: Text(
                  items[index]['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.styleRegular14(context),
                ),
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
