import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomItemsAvailableLiteTile extends StatelessWidget {
  const CustomItemsAvailableLiteTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.count,
  });
  final String title, subtitle, count;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: AppTextStyle.styleRegular16(context)),
      subtitle: Text(
        'Expires: $subtitle',
        style: AppTextStyle.styleRegular14(context),
      ),
      trailing: CustomContainer(
        padding: 4,
        child: Text(count, style: AppTextStyle.styleRegular16(context)),
      ),
    );
  }
}
