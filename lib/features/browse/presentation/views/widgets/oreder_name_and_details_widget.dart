import 'package:flutter/material.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/themes/app_text_style.dart';

class OrederNameAndDetailsWidget extends StatelessWidget {
  const OrederNameAndDetailsWidget({
    super.key,
    required this.postAction,
    required this.postEntity,
  });
  final Widget postAction;
  final PostEntity postEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                postEntity.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.styleRegular16(context),
              ),
            ),
            postAction,
          ],
        ),
        Text(
          postEntity.description,
          style: AppTextStyle.styleRegular14(context),
        ),
      ],
    );
  }
}
