import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class OrderStatsRow extends StatelessWidget {
  const OrderStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _OrderStatItem(
          title: 'Meals',
          value: '45',
          color: AppColors.primaryColor,
        ),
        _OrderStatItem(
          title: 'Distance',
          value: '2.3 miles',
          color: AppColors.blueColor,
        ),
        _OrderStatItem(
          title: 'Posted',
          value: '2 hours ago',
          color: AppColors.orangeColor,
        ),
      ],
      // children: [
      //   Column(
      //     children: [
      //       Text('Meals', style: AppTextStyle.styleRegular14(context)),
      //       Text(
      //         '45',
      //         style: AppTextStyle.styleBold16(
      //           context,
      //         ).copyWith(color: AppColors.primaryColor),
      //       ),
      //     ],
      //   ),
      //   Column(
      //     children: [
      //       Text('Distance', style: AppTextStyle.styleRegular14(context)),
      //       Text(
      //         '2.3 miles',
      //         style: AppTextStyle.styleBold16(
      //           context,
      //         ).copyWith(color: AppColors.blueColor),
      //       ),
      //     ],
      //   ),
      //   Column(
      //     children: [
      //       Text('Posted', style: AppTextStyle.styleRegular14(context)),
      //       Text(
      //         '2 hours ago',
      //         style: AppTextStyle.styleBold16(
      //           context,
      //         ).copyWith(color: AppColors.orangeColor),
      //       ),
      //     ],
      //   ),
      // ],
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
