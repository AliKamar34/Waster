import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_order_state_widget.dart';

class CustomNearOrdersWidget extends StatelessWidget {
  const CustomNearOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        spacing: 7,
        children: [
          SvgPicture.asset(Assets.start, width: 60),
          Expanded(
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Artisan Bread',
                      style: AppTextStyle.styleRegular16(context),
                    ),
                    CustomOrderStateWidget(
                      color: Theme.of(
                        context,
                      ).extension<AppColors>()!.orangeColor,
                      state: LocaleKeys.Urgent.tr(),
                    ),
                  ],
                ),
                Text(
                  'Corner Bakery',
                  style: AppTextStyle.styleRegular14(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '12 ${LocaleKeys.loaves.tr()}',
                      style: AppTextStyle.styleRegular14(context),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.location),
                        Text(
                          '1.2 ${LocaleKeys.miles.tr()}',
                          style: AppTextStyle.styleRegular14(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(Assets.pending),
                    Text(
                      '${LocaleKeys.expires_in_hours.tr()} 6',
                      style: AppTextStyle.styleRegular14(context).copyWith(
                        color: Theme.of(
                          context,
                        ).extension<AppColors>()!.orangeColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
