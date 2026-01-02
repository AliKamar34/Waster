import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/utils/service_locator.dart';
import 'package:waster/core/utils/show_blur_bottom_sheet.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/features/browse/presentation/views/widgets/location_section.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_details_app_bar.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_summary_section.dart';
import 'package:waster/features/browse/presentation/views/widgets/schedule_section.dart';
import 'package:waster/features/claim/presentation/manager/cubit/claim_cubit.dart';
import 'package:waster/features/claim/presentation/views/widgets/claims_post_bottom_sheet.dart';
import 'package:waster/features/home/presentation/views/widgets/save_post_action.dart';
import 'package:waster/features/post/presentation/views/widgets/post_iamge_widget.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    super.key,
    required this.postEntity,
    required this.postAction,
  });
  final PostEntity postEntity;
  final Widget postAction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              OrderDetailsAppBar(status: postEntity.status!),
              Hero(
                tag: 'post-image-${postEntity.id}',
                child: PostIamgeWidget(imageUrl: postEntity.imageUrl!),
              ),
              OrderSummarySection(
                postEntity: postEntity,
                postAction: postAction,
              ),
              LocationSection(location: postEntity.pickupLocation),
              ScheduleSection(postEntity: postEntity),
              BlocProvider(
                create: (_) => sl<ClaimCubit>(),
                child: BlocConsumer<ClaimCubit, ClaimState>(
                  listener: (context, state) {
                    if (state is ClaimPostSuccess) {
                      showToast(context, 'Post claimed successfully');
                    } else if (state is ClaimFailure) {
                      showToast(context, state.message, isError: true);
                    }
                  },
                  builder: (context, state) {
                    return postAction is SavePostAction
                        ? CustomButton(
                            title: (state is ClaimPostLoading)
                                ? 'Loading...'
                                : 'Claim Post',
                            onPressed: (state is ClaimPostLoading)
                                ? null
                                : () {
                                    context.read<ClaimCubit>().claimPost(
                                      postEntity.id,
                                    );
                                  },
                          )
                        : CustomButton(
                            title: (state is GetPostClaimsLoading)
                                ? 'Loading...'
                                : 'Show Claims',
                            onPressed: (state is GetPostClaimsLoading)
                                ? null
                                : () {
                                    context.read<ClaimCubit>().getPostClaims(
                                      postEntity.id,
                                    );
                                    showBlurBottomSheet(
                                      context,
                                      (bottomContext) => BlocProvider.value(
                                        value: context.read<ClaimCubit>(),
                                        child: const ClaimsPostBottomSheet(),
                                      ),
                                    );
                                  },
                          );
                  },
                ),
              ),

              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
