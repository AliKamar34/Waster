import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
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
        Text('Recent Donations', style: AppTextStyle.styleRegular18(context)),
        CustomOrderDetailContainer(
          title: 'Fresh Vegetables',
          icon: Assets.delivered,
          state: 'delivered',
          count: '15 items',
          to: 'City Food Bank',
          time: '2 hours ago',
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),
        CustomOrderDetailContainer(
          title: 'Baked Goods',
          icon: Assets.pending,
          state: 'pending',
          count: '15 items',
          to: 'Community Kitchen',
          time: '30 minute ago',
          color: Theme.of(context).extension<AppColors>()!.orangeColor,
        ),
        CustomOrderDetailContainer(
          title: 'Prepared Meals',
          icon: Assets.expired,
          state: 'expired',
          count: '10 portions',
          to: '',
          time: '1 day ago',
          color: Theme.of(context).extension<AppColors>()!.redColor,
        ),
      ],
    );
  }
}
