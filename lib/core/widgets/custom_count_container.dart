import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomCountContainer extends StatelessWidget {
  const CustomCountContainer({
    super.key,
    required this.count,
    required this.title,
    required this.color,
  });
  final String count, title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomContainer(
        height: 150.h,
        borderRadius: 14.r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              count,
              style: AppTextStyle.styleRegular18(
                context,
              ).copyWith(color: color),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.styleRegular14(context),
            ),
          ],
        ),
      ),
    );
  }
}
