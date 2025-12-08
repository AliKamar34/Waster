import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_stats_row.dart';
import 'package:waster/features/browse/presentation/views/widgets/oreder_name_and_details_widget.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    super.key,
    required this.postEntity,
    required this.postAction,
  });
  final PostEntity postEntity;
  final Widget postAction;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrederNameAndDetailsWidget(
            postAction: postAction,
            postEntity: postEntity,
          ),
          OrderStatsRow(postEntity: postEntity),
          CustomContainer(
            padding: 4.w,
            borderWidth: 1.5,
            borderRadius: 8.r,
            borderColor: Theme.of(context).extension<AppColors>()!.borderColor,
            child: Text(
              postEntity.category,
              style: AppTextStyle.styleRegular14(context),
            ),
          ),
        ],
      ),
    );
  }
}
