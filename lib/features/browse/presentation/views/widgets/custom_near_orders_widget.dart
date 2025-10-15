import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
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
                      state: 'Urgent',
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
                      '12 loaves',
                      style: AppTextStyle.styleRegular14(context),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.location),
                        Text(
                          '1.2 miles',
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
                      'Expires in 6 hours',
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
