import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/utils/date_formatter.dart';

class OrderStatsRow extends StatelessWidget {
  const OrderStatsRow({super.key, this.postEntity});
  final PostEntity? postEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _OrderStatItem(
          title: postEntity?.unit ?? LocaleKeys.meals.tr(),
          value: postEntity?.quantity ?? '45',
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
        ),

        _OrderStatItem(
          title: LocaleKeys.posted.tr(),
          value: postEntity?.created != null
              ? DateFormatter.formatRelative(postEntity!.created, context)
              : '2 ${LocaleKeys.hours_ago.tr()}',
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
