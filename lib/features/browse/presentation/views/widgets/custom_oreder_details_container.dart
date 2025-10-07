import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/donor_iformation_list_tile.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_stats_row.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_tags_list_view.dart';
import 'package:waster/features/browse/presentation/views/widgets/oreder_name_and_details_widget.dart';

class CustomOrederDetailsContainer extends StatelessWidget {
  const CustomOrederDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes.orderDetailsView);
      },
      child: CustomContainer(
        child: Column(
          spacing: 36,
          children: [
            const OrederNameAndDetailsWidget(),
            const DonorIformationListTile(),
            const OrderStatsRow(),
            Row(
              children: [
                SvgPicture.asset(Assets.timer),
                Text(
                  'Pickup: Today, 4:00 PM - 6:00 PM',
                  style: AppTextStyle.styleRegular14(context),
                ),
              ],
            ),
            const OrderTagsListView(),
          ],
        ),
      ),
    );
  }
}
