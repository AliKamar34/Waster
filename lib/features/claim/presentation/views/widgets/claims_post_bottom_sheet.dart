import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/utils/show_overlay_toast.dart';
import 'package:waster/core/widgets/custom_empty_widget.dart';
import 'package:waster/features/claim/presentation/manager/cubit/claim_cubit.dart';
import 'package:waster/features/claim/presentation/views/widgets/custom_claims_post_widget.dart';
import 'package:waster/features/claim/presentation/views/widgets/custom_post_claims_loading_widget.dart';

class ClaimsPostBottomSheet extends StatelessWidget {
  const ClaimsPostBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.5,
      builder: (context, scroll) => Column(
        children: [
          Center(
            child: Container(
              width: 80,
              height: 5,
              margin: const EdgeInsets.only(top: 16, bottom: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).extension<AppColors>()!.blackTextColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          BlocConsumer<ClaimCubit, ClaimState>(
            listener: (context, state) {
              if (state is ClaimActionSuccess) {
                showOverlayToast(context, state.message);
                context.read<ClaimCubit>().getPostClaims(state.claimId);
              } else if (state is ClaimActionFailure) {
                showOverlayToast(context, state.message, isError: true);
                context.read<ClaimCubit>().getPostClaims(state.claimId);
              }
            },
            builder: (context, state) {
              if (state is GetPostClaimsSuccess) {
                return Expanded(
                  child: ListView.builder(
                    controller: scroll,
                    itemCount: state.claims.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CustomClaimsPostWidget(
                          claimEntity: state.claims[index],
                        ),
                      );
                    },
                  ),
                );
              } else if (state is GetPostClaimsLoading) {
                return const CustomPostClaimsLoadingWidget();
              } else if (state is ClaimFailure) {
                return Expanded(
                  child: Center(
                    child: Text(
                      state.message,
                      style: AppTextStyle.styleRegular16(context).copyWith(
                        color: Theme.of(
                          context,
                        ).extension<AppColors>()!.redColor,
                      ),
                    ),
                  ),
                );
              } else if (state is PostClaimsEmpty) {
                return const CustomEmptyWidget(message: 'no Claims');
              } else {
                return Expanded(
                  child: Center(
                    child: Text(
                      'No Claims Found',
                      style: AppTextStyle.styleRegular16(context).copyWith(
                        color: Theme.of(
                          context,
                        ).extension<AppColors>()!.blackTextColor,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
