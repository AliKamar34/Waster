import 'package:flutter/material.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/themes/app_text_style.dart';

class OrederNameAndDetailsWidget extends StatelessWidget {
  const OrederNameAndDetailsWidget({
    super.key,
    this.postAction,
    this.postEntity,
  });
  final Widget? postAction;
  final PostEntity? postEntity;
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
                postEntity?.title ?? 'Fresh Bakery Items',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.styleRegular16(context),
              ),
            ),
            postAction ?? const SizedBox.shrink(),
          ],
        ),
        Text(
          postEntity?.description ??
              'Assorted pastries, bread, and desserts from today\'s production',
          style: AppTextStyle.styleRegular14(context),
        ),
      ],
    );
  }
}
