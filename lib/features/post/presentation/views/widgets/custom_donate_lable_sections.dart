import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomDonateLableSections extends StatelessWidget {
  const CustomDonateLableSections({
    super.key,
    required this.image,
    required this.lable,
  });
  final String image, lable;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        SvgPicture.asset(
          image,
          colorFilter: ColorFilter.mode(
            Theme.of(context).extension<AppColors>()!.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        Text(
          lable,
          style: AppTextStyle.styleRegular18(context).copyWith(
            color: Theme.of(context).extension<AppColors>()!.primaryColor,
          ),
        ),
      ],
    );
  }
}
