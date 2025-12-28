import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/claim/presentation/views/widgets/claim_post_status_tab_bar.dart';
import 'package:waster/features/claim/presentation/views/widgets/user_claims_list_view_bloc_builder.dart';

class ClaimView extends StatelessWidget {
  const ClaimView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          spacing: 16,
          children: [
            CustomAppBar(title: LocaleKeys.claimedPosts.tr()),
            const ClaimPostStatusTabBar(),
            const UserClaimsListViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
