import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_text_style.dart';

class ClaimedPostTextInfo extends StatelessWidget {
  const ClaimedPostTextInfo({
    super.key,
    required this.infoTitle,
    required this.infoData,
  });
  final String infoTitle, infoData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(infoTitle, style: AppTextStyle.styleRegular18(context)),
        Text(infoData, style: AppTextStyle.styleRegular16(context)),
      ],
    );
  }
}
