import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
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
                    'FoodShare',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.styleRegular18(
                      context,
                    ).copyWith(color: AppColors.primaryColor),
                  ),
                  Text(
                    'Rescue Food, Feed Communities, Reduce Waste',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.styleRegular18(context),
                  ),
                  CustomStartWidget(
                    icon: Assets.leaf,
                    title: 'Reduce Food Waste',
                    subtitle: 'Turn surplus food into community meals',
                    color: AppColors.primaryColor,
                  ),
                  CustomStartWidget(
                    icon: Assets.heart,
                    title: 'Feed Communities',
                    subtitle: 'Connect donors with those in need',
                    color: AppColors.orangeColor,
                  ),
                  CustomStartWidget(
                    icon: Assets.truck,
                    title: 'Volunteer Network',
                    subtitle: 'Join drivers making a difference',
                    color: AppColors.blueColor,
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    title: 'Get Started',
                    backgroundColor: AppColors.primaryColor,
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
