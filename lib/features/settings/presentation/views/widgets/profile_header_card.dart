// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
// import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';
// import 'package:waster/features/settings/presentation/views/widgets/profile_badges_list.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key, required this.user});

  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 24.w,
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
                      user.fullName,
                      style: AppTextStyle.styleRegular16(context),
                    ),
                    InkWell(
                      onTap: () {
                        context.pushNamed(
                          AppRoutes.profileEditingView,
                          extra: {
                            'bloc': context.read<SettingsBloc>(),
                            'user': user,
                          },

                          // user,
                        );
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
                      user.address,
                      style: AppTextStyle.styleRegular14(context),
                    ),
                  ],
                ),

                // Row(
                //   spacing: 6,
                //   children: [
                //     const Icon(Icons.star, color: Colors.amber),
                //     Text('4.5', style: AppTextStyle.styleRegular14(context)),
                //     Text(
                //       '(127 ${LocaleKeys.orders.tr()})',
                //       style: AppTextStyle.styleRegular14(context),
                //     ),
                //   ],
                // ),
                Text(
                  user.bio ?? '',
                  maxLines: 2,
                  style: AppTextStyle.styleRegular14(context),
                ),
                // const ProfileBadgesList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
