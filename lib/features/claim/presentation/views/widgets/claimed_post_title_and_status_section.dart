import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/claim/domain/entity/claim_post_entity.dart';

class ClaimedPostTitleAndStatusSection extends StatelessWidget {
  const ClaimedPostTitleAndStatusSection({
    super.key,
    required this.claimPostEntity,
  });
  final ClaimPostEntity claimPostEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            claimPostEntity.title,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.styleBold20(context),
          ),
        ),
        CustomContainer(
          padding: 2.w,
          borderRadius: 8.r,
          backgroundColor: Theme.of(
            context,
          ).extension<AppColors>()!.orangeColor,
          child: Row(
            spacing: 4,
            children: [
              SvgPicture.asset(
                Assets.delivered,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).extension<AppColors>()!.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                claimPostEntity.status,
                style: AppTextStyle.styleRegular14(context).copyWith(
                  color: Theme.of(context).extension<AppColors>()!.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
