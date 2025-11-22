import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_stats_row.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_tags_list_view.dart';
import 'package:waster/features/browse/presentation/views/widgets/oreder_name_and_details_widget.dart';
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
          children: [
            PostIamgeWidget(imageUrl: postEntity.imageUrl!),
            OrederNameAndDetailsWidget(
              postEntity: postEntity,
              postAction: MyPostPopUpMenuButton(postEntity: postEntity),
            ),
            OrderStatsRow(postEntity: postEntity),
            const OrderTagsListView(),
          ],
        ),
      ),
    );
  }
}
