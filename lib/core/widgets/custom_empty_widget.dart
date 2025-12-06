import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({
    super.key,
    required this.message,
    this.actionWidget,
  });
  final String message;
  final Widget? actionWidget;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.noResultImage),
          Text(message, style: AppTextStyle.styleBold16(context)),
          actionWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
