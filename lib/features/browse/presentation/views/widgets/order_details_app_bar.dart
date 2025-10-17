import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class OrderDetailsAppBar extends StatelessWidget {
  const OrderDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        Center(
          child: Text(
            LocaleKeys.order_details.tr(),
            style: AppTextStyle.styleBold20(context),
          ),
        ),
        const Spacer(),
        CustomContainer(
          padding: 2,
          borderRadius: 8,
          backgroundColor: Theme.of(
            context,
          ).extension<AppColors>()!.orangeColor,
          child: Row(
            spacing: 4,
            children: [
              SvgPicture.asset(
                Assets.pending,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).extension<AppColors>()!.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                LocaleKeys.pending.tr(),
                style: AppTextStyle.styleRegular14(context).copyWith(
                  color: Theme.of(context).extension<AppColors>()!.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
