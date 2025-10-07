import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      title: Text('Available Food', style: AppTextStyle.styleBold24(context)),
      subtitle: Text(
        'Find fresh donations near you',
        style: AppTextStyle.styleRegular16(context),
      ),
      trailing: InkWell(
        onTap: () {
          context.pushNamed(AppRoutes.browseAllView);
        },
        child: CustomContainer(
          padding: 6,
          backgroundColor: AppColors.scaffoldColor,
          borderWidth: 2,
          child: Text(
            'Browse All',
            style: AppTextStyle.styleRegular16(context),
          ),
        ),
      ),
    );
  }
}
