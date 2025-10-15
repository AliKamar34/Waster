import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomOrderCallingInfoSection extends StatelessWidget {
  const CustomOrderCallingInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        SvgPicture.asset(Assets.phone),
        Text(
          '(555) 123-4567',
          style: AppTextStyle.styleRegular14(context).copyWith(
            color: Theme.of(context).extension<AppColors>()!.blackTextColor,
          ),
        ),
        const Spacer(),
        Text('ETA:', style: AppTextStyle.styleRegular14(context)),
        Text(
          '2:45 PM',
          style: AppTextStyle.styleRegular14(context).copyWith(
            color: Theme.of(context).extension<AppColors>()!.blackTextColor,
          ),
        ),
      ],
    );
  }
}
