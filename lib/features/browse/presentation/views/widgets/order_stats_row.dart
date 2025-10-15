import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class OrderStatsRow extends StatelessWidget {
  const OrderStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _OrderStatItem(
          title: 'Meals',
          value: '45',
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),
        _OrderStatItem(
          title: 'Distance',
          value: '2.3 miles',
          color: Theme.of(context).extension<AppColors>()!.blueColor,
        ),
        _OrderStatItem(
          title: 'Posted',
          value: '2 hours ago',
          color: Theme.of(context).extension<AppColors>()!.orangeColor,
        ),
      ],
    );
  }
}

class _OrderStatItem extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _OrderStatItem({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextStyle.styleRegular14(context)),
        Text(
          value,
          style: AppTextStyle.styleBold16(context).copyWith(color: color),
        ),
      ],
    );
  }
}
