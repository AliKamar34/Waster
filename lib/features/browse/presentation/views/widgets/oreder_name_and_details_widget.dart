import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_text_style.dart';

class OrederNameAndDetailsWidget extends StatelessWidget {
  const OrederNameAndDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          spacing: 4,
          children: [
            Text(
              'Fresh Bakery Items',
              style: AppTextStyle.styleRegular16(context),
            ),
            SvgPicture.asset(Assets.expired),
          ],
        ),
        Text(
          'Assorted pastries, bread, and desserts from today\'s production',
          style: AppTextStyle.styleRegular14(context),
        ),
      ],
    );
  }
}
