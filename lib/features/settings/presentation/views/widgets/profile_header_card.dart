import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_badges_list.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 24,
      child: Row(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 75,
            width: 75,
            color: Theme.of(context).extension<AppColors>()!.primaryColor,
          ),
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sarah Johnson',
                      style: AppTextStyle.styleRegular16(context),
                    ),
                    InkWell(
                      onTap: () {
                        context.pushNamed(AppRoutes.profileEditingView);
                      },
                      child: SvgPicture.asset(Assets.edit),
                    ),
                  ],
                ),
                Row(
                  spacing: 6,
                  children: [
                    SvgPicture.asset(Assets.location),
                    Text(
                      'New York, NY',
                      style: AppTextStyle.styleRegular14(context),
                    ),
                  ],
                ),
                Row(
                  spacing: 6,
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    Text('4.5', style: AppTextStyle.styleRegular14(context)),
                    Text(
                      '(127orders)',
                      style: AppTextStyle.styleRegular14(context),
                    ),
                  ],
                ),

                Text(
                  'Local bakery owner passionate about reducing food ',
                  maxLines: 2,
                  style: AppTextStyle.styleRegular14(context),
                ),
                const ProfileBadgesList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
