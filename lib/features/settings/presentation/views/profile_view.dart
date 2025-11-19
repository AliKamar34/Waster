import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_view_body_bloc_builder.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16.w),
      child: const SingleChildScrollView(
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
