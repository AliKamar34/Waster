import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_light_color_container.dart';

class LeaderboardItem extends StatelessWidget {
  const LeaderboardItem({
    super.key,
    required this.rank,
    required this.name,
    required this.donations,
  });
  final String name;
  final int rank, donations;
  @override
  Widget build(BuildContext context) {
    return CustomLightColorContainer(
      padding: 4,
      color: name == 'You'
          ? Theme.of(context).extension<AppColors>()!.primaryColor
          : Theme.of(context).extension<AppColors>()!.whiteColor,
      child: Row(
        spacing: 10,
        children: [
          CircleAvatar(
            backgroundColor: name == 'You'
                ? Theme.of(context).extension<AppColors>()!.primaryColor
                : Theme.of(context).extension<AppColors>()!.orangeColor,
            child: Text('$rank'),
          ),
          Text(name, style: AppTextStyle.styleRegular16(context)),
          const Spacer(),
          Text(
            '$donations ${LocaleKeys.donations.tr()}',
            style: AppTextStyle.styleRegular14(context).copyWith(
              color: name == 'You'
                  ? Theme.of(context).extension<AppColors>()!.primaryColor
                  : Theme.of(context).extension<AppColors>()!.greyTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
