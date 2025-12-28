import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_empty_widget.dart';
import 'package:waster/features/claim/presentation/manager/cubit/claim_cubit.dart';
import 'package:waster/features/claim/presentation/views/widgets/claimed_post_container.dart';
import 'package:waster/features/claim/presentation/views/widgets/custom_user_claims_loading_widget.dart';

class UserClaimsListViewBlocBuilder extends StatelessWidget {
  const UserClaimsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClaimCubit, ClaimState>(
      builder: (context, state) {
        if (state is GetUserClaimsSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.claims.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ClaimedPostContainer(claimEntity: state.claims[index]),
                );
              },
            ),
          );
        } else if (state is GetUserClaimsLoading) {
          return const CustomUserClaimsLoadingWidget();
        } else if (state is ClaimFailure) {
          return Center(
            child: Text(
              state.message,
              style: AppTextStyle.styleBold20(context),
            ),
          );
        } else if (state is UserClaimsEmpty) {
          return const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomEmptyWidget(message: 'No claimed posts found'),
            ),
          );
        } else {
          return Center(
            child: Text(
              'something went wrong',
              style: AppTextStyle.styleBold20(context),
            ),
          );
        }
      },
    );
  }
}
