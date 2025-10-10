import 'package:flutter/material.dart';
import 'package:waster/features/settings/presentation/views/widgets/contact_info_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:waster/features/settings/presentation/views/widgets/member_since_widget.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_header_card.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_statistics_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          spacing: 24,
          children: [
            CustomProfileAppBar(),
            ProfileHeaderCard(),
            ProfileStatisticsSection(),
            ContactInfoSection(),
            MembersinceWidget(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
