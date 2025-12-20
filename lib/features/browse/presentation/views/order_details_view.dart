import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/utils/show_blur_bottom_sheet.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/features/browse/presentation/views/widgets/location_section.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_details_app_bar.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_summary_section.dart';
import 'package:waster/features/browse/presentation/views/widgets/schedule_section.dart';
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
              PostIamgeWidget(imageUrl: postEntity.imageUrl!),
              OrderSummarySection(
                postEntity: postEntity,
                postAction: postAction,
              ),
              LocationSection(location: postEntity.pickupLocation),
              ScheduleSection(postEntity: postEntity),
              postAction is SavePostAction
                  ? CustomButton(title: 'Claim Post', onPressed: () {})
                  : CustomButton(
                      title: 'Show Claims',
                      onPressed: () {
                        showBlurBottomSheet(
                          context,
                          (bottomContext) => const ClaimsPostBottomSheet(),
                        );
                      },
                    ),

              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
