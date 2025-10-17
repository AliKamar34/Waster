import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/features/start/views/widgets/custom_start_widget.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.35,
              child: SvgPicture.asset(Assets.start, fit: BoxFit.fill),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                spacing: 16,
                children: [
                  Text(
                    LocaleKeys.foodshare.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.styleRegular18(context).copyWith(
                      color: Theme.of(
                        context,
                      ).extension<AppColors>()!.primaryColor,
                    ),
                  ),
                  Text(
                    LocaleKeys.rescue_food_tagline.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.styleRegular18(context),
                  ),
                  CustomStartWidget(
                    icon: Assets.leaf,
                    title: LocaleKeys.Reduce_Food_Waste.tr(),
                    subtitle:
                        LocaleKeys.Turn_surplus_food_into_community_meals.tr(),
                    color: Theme.of(
                      context,
                    ).extension<AppColors>()!.primaryColor,
                  ),
                  CustomStartWidget(
                    icon: Assets.heart,
                    title: LocaleKeys.Feed_Communities.tr(),
                    subtitle: LocaleKeys.Connect_donors_with_those_in_need.tr(),
                    color: Theme.of(
                      context,
                    ).extension<AppColors>()!.orangeColor,
                  ),
                  CustomStartWidget(
                    icon: Assets.truck,
                    title: LocaleKeys.Volunteer_Network.tr(),
                    subtitle: LocaleKeys.Join_drivers_making_a_difference.tr(),
                    color: Theme.of(context).extension<AppColors>()!.blueColor,
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    title: LocaleKeys.Get_Started.tr(),
                    backgroundColor: Theme.of(
                      context,
                    ).extension<AppColors>()!.primaryColor,
                    onPressed: () {
                      context.pushNamed(AppRoutes.login);
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
