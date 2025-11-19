import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomFilterContainer extends StatelessWidget {
  const CustomFilterContainer({
    super.key,
    required this.icon,
    required this.title,
  });
  final String icon, title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: CustomContainer(
          padding: 4.w,
          backgroundColor: Theme.of(
            context,
          ).extension<AppColors>()!.scaffoldColor,
          borderWidth: 2,
          child: Row(
            spacing: 8.r,
            children: [
              SvgPicture.asset(icon),
              Text(title, style: AppTextStyle.styleRegular16(context)),
            ],
          ),
        ),
      ),
    );
  }
}
