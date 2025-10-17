import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_order_detail_container.dart';

class RecentDonationsSection extends StatelessWidget {
  const RecentDonationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.recent_donations.tr(),
          style: AppTextStyle.styleRegular18(context),
        ),
        CustomOrderDetailContainer(
          title: 'Fresh Vegetables',
          icon: Assets.delivered,
          state: LocaleKeys.delivery.tr(),
          count: '15 ${LocaleKeys.items.tr()}',
          to: 'City Food Bank',
          time: '2 ${LocaleKeys.hours_ago.tr()}',
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),
        CustomOrderDetailContainer(
          title: 'Baked Goods',
          icon: Assets.pending,
          state: LocaleKeys.pending.tr(),
          count: '15 ${LocaleKeys.items.tr()}',
          to: 'Community Kitchen',
          time: '30 ${LocaleKeys.minutes_ago.tr()}',
          color: Theme.of(context).extension<AppColors>()!.orangeColor,
        ),
        CustomOrderDetailContainer(
          title: 'Prepared Meals',
          icon: Assets.expired,
          state: LocaleKeys.expired.tr(),
          count: '10 ${LocaleKeys.portions.tr()}',
          to: '',
          time: '1 ${LocaleKeys.days_ago.tr()}',
          color: Theme.of(context).extension<AppColors>()!.redColor,
        ),
      ],
    );
  }
}
