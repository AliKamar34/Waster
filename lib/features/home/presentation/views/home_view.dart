import 'package:flutter/material.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:waster/features/home/presentation/views/widgets/home_count_section.dart';
import 'package:waster/features/home/presentation/views/widgets/impact_of_month_widget.dart';
import 'package:waster/features/home/presentation/views/widgets/recent_donations_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          spacing: 24,
          children: [
            const CustomHomeAppBar(),
            const HomeCountSection(),
            CustomButton(title: 'Post New Donation', onPressed: () {}),
            const RecentDonationsSection(),
            const ImpactOfMonthWidget(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
