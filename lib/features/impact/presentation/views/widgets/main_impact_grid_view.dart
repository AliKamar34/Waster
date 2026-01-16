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
        'hint': LocaleKeys.food_items_donated.tr(),
      },
      {
        'count': '156',
        'color': Theme.of(context).extension<AppColors>()!.orangeColor,
        'title': LocaleKeys.Meals_Served.tr(),
        'hint': LocaleKeys.since_joining.tr(),
      },
      {
        'count': '342',
        'color': Theme.of(context).extension<AppColors>()!.blueColor,
        'title': LocaleKeys.available_posts.tr(),
        'hint': LocaleKeys.active_iistings.tr(),
      },
      {
        'count': '89',
        'color': Theme.of(context).extension<AppColors>()!.redColor,
        'title': LocaleKeys.total_claims.tr(),
        'hint': LocaleKeys.completed_pickups.tr(),
      },
      {
        'count': '89',
        'color': Theme.of(context).extension<AppColors>()!.blackTextColor,
        'title': LocaleKeys.pending_claims.tr(),
        'hint': LocaleKeys.awaiting_confirmation.tr(),
      },
    ];
    return CustomImpactGridView(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CustomContainer(
          padding: 8,
          backgroundColor: items[index]['color'].withAlpha(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                items[index]['title'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.styleBold16(context),
              ),
              Text(
                items[index]['count'],
                style: AppTextStyle.styleBold16(context),
              ),
              Text(
                items[index]['hint'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.styleMeduim14(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
