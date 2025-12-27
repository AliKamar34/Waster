import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/claim/presentation/manager/cubit/claim_cubit.dart';
import 'package:waster/features/claim/presentation/views/widgets/claimed_post_container.dart';

class ClaimView extends StatelessWidget {
  const ClaimView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            CustomAppBar(title: LocaleKeys.claimedPosts.tr()),
            BlocBuilder<ClaimCubit, ClaimState>(
              builder: (context, state) {
                if (state is GetUserClaimsSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.claims.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ClaimedPostContainer(
                            claimEntity: state.claims[index],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: SizedBox(),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
