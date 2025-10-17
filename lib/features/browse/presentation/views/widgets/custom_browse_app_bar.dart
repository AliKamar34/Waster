import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomBrowseAppBar extends StatelessWidget {
  const CustomBrowseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        LocaleKeys.available_food.tr(),
        style: AppTextStyle.styleBold24(context),
      ),
      subtitle: Text(
        LocaleKeys.find_fresh_donations_near_you.tr(),
        style: AppTextStyle.styleRegular16(context),
      ),
      trailing: InkWell(
        onTap: () {
          context.pushNamed(AppRoutes.browseAllView);
        },
        child: CustomContainer(
          padding: 6,
          backgroundColor: Theme.of(
            context,
          ).extension<AppColors>()!.scaffoldColor,
          borderWidth: 2,
          child: Text(
            LocaleKeys.browse_all.tr(),
            style: AppTextStyle.styleRegular16(context),
          ),
        ),
      ),
    );
  }
}
