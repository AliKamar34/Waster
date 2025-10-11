import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomSettingsContainer extends StatelessWidget {
  const CustomSettingsContainer({
    super.key,
    required this.title,
    required this.children,
  });
  final List<Widget> children;
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.styleRegular16(context)),
          const SizedBox(height: 6),
          ...children,
        ],
      ),
    );
  }
}
