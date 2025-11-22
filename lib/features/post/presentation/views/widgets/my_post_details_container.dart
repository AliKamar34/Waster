import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/utils/date_formatter.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_stats_row.dart';
import 'package:waster/features/browse/presentation/views/widgets/oreder_name_and_details_widget.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_order_state_widget.dart';
import 'package:waster/features/post/presentation/views/widgets/my_post_pop_up_menu_button.dart';
import 'package:waster/features/post/presentation/views/widgets/post_iamge_widget.dart';

class MyPostDetailsContainer extends StatelessWidget {
  const MyPostDetailsContainer({super.key, required this.postEntity});
  final PostEntity postEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes.orderDetailsView);
      },
      child: CustomContainer(
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostIamgeWidget(imageUrl: postEntity.imageUrl!),
            OrederNameAndDetailsWidget(
              postEntity: postEntity,
              postAction: MyPostPopUpMenuButton(postEntity: postEntity),
            ),
            OrderStatsRow(postEntity: postEntity),
            Row(
              children: [
                Text(
                  '${LocaleKeys.Expires.tr()} : ',
                  style: AppTextStyle.styleRegular14(context),
                ),
                Text(
                  DateFormatter.formatRelative(postEntity.expiresOn, context),
                  style: AppTextStyle.styleBold16(context).copyWith(
                    color: Theme.of(context).extension<AppColors>()!.blueColor,
                  ),
                ),
                const Spacer(),
                CustomOrderStateWidget(
                  color: Theme.of(context).extension<AppColors>()!.blueColor,
                  state: postEntity.status!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
