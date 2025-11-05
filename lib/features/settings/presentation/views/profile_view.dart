import 'package:flutter/material.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_view_body_bloc_builder.dart';

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
            ProfileViewBodyBlocBuilder(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
