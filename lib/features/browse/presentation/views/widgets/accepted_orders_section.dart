import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/core/widgets/custom_light_color_container.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_order_state_widget.dart';

class AcceptedOrdersSection extends StatelessWidget {
  const AcceptedOrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.my_accepted_orders.tr(),
              style: AppTextStyle.styleRegular18(context),
            ),
            InkWell(
              onTap: () {
                context.pushNamed(AppRoutes.trackAllView);
              },
              child: CustomContainer(
                padding: 6.w,
                backgroundColor: Theme.of(
                  context,
                ).extension<AppColors>()!.scaffoldColor,
                borderWidth: 2,
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.package),
                    Text(
                      LocaleKeys.track_all.tr(),
                      style: AppTextStyle.styleRegular16(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        CustomLightColorContainer(
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              LocaleKeys.orders.tr(),
              style: AppTextStyle.styleRegular16(context),
            ),
            subtitle: Text(
              LocaleKeys.ready_for_pickup.tr(),
              style: AppTextStyle.styleRegular14(context),
            ),
            trailing: CustomOrderStateWidget(
              color: Theme.of(context).extension<AppColors>()!.primaryColor,
              state: LocaleKeys.Accepted.tr(),
            ),
          ),
        ),
      ],
    );
  }
}
