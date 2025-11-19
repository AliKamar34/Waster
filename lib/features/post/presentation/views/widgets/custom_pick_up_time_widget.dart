import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_light_color_container.dart';

class CustomPickUpTimeWidget extends StatelessWidget {
  const CustomPickUpTimeWidget({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomLightColorContainer(
      color: Theme.of(context).extension<AppColors>()!.blueColor,
      padding: 16.w,
      child: Row(
        spacing: 50,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.pickup_time.tr(),
            style: AppTextStyle.styleRegular16(context).copyWith(
              color: Theme.of(context).extension<AppColors>()!.blueColor,
            ),
          ),
          Expanded(
            child: CustomButton(
              backgroundColor: Theme.of(
                context,
              ).extension<AppColors>()!.whiteColor,
              borderColor: Theme.of(context).extension<AppColors>()!.blueColor,
              title: LocaleKeys.timing.tr(),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
