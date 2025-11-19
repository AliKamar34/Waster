import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class MyOrdersItemsSection extends StatelessWidget {
  const MyOrdersItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.items.tr(),
          style: AppTextStyle.styleRegular14(context),
        ),
        SizedBox(
          height: 30.h,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(end: 4.w),
                child: CustomContainer(
                  padding: 4.w,
                  borderWidth: 1.5,
                  borderRadius: 8.r,
                  borderColor: Theme.of(
                    context,
                  ).extension<AppColors>()!.borderColor,
                  child: Text(
                    LocaleKeys.beverages.tr(),
                    style: AppTextStyle.styleRegular14(context),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
