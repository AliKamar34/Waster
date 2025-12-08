import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/oreder_name_and_details_widget.dart';
import 'package:waster/features/post/presentation/views/widgets/post_iamge_widget.dart';

class PostDetailsContainer extends StatelessWidget {
  const PostDetailsContainer({
    super.key,
    required this.postEntity,
    required this.postAction,
  });
  final PostEntity postEntity;
  final Widget postAction;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRoutes.orderDetailsView,
          extra: {'postAction': postAction, 'post': postEntity},
        );
      },
      child: CustomContainer(
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostIamgeWidget(imageUrl: postEntity.imageUrl!),
            OrederNameAndDetailsWidget(
              postEntity: postEntity,
              postAction: postAction,
            ),
          ],
        ),
      ),
    );
  }
}
