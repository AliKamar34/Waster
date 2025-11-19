import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:waster/features/home/presentation/views/widgets/home_count_section.dart';
import 'package:waster/features/home/presentation/views/widgets/impact_of_month_widget.dart';
import 'package:waster/features/home/presentation/views/widgets/recent_donations_section.dart';
import 'package:waster/features/post/domain/entity/enums/post_mode_enum.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          spacing: 24,
          children: [
            const CustomHomeAppBar(),
            const HomeCountSection(),
            CustomButton(
              title: LocaleKeys.post_food_donation.tr(),
              onPressed: () {
                context.pushNamed(
                  AppRoutes.donateView,
                  extra: {'postMode': PostMode.create, 'post': null},
                );
              },
            ),
            const RecentDonationsSection(),
            const ImpactOfMonthWidget(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
