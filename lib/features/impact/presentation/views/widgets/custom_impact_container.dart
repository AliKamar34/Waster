import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/core/widgets/custom_light_color_container.dart';

class CustomImpactContainer extends StatelessWidget {
  const CustomImpactContainer({
    super.key,
    required this.title,
    required this.count,
    required this.image,
  });

  final String title, count, image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomContainer(
        padding: 16,
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLightColorContainer(
              padding: 8,
              color: Theme.of(context).extension<AppColors>()!.primaryColor,
              child: SvgPicture.asset(
                image,
                width: 24,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).extension<AppColors>()!.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.styleRegular14(context),
            ),
            Text(count, style: AppTextStyle.styleBold16(context)),
          ],
        ),
      ),
    );
  }
}
