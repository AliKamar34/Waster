import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomDonateAppBar extends StatelessWidget {
  const CustomDonateAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      title: Text(
        'Post Food Donation',
        style: AppTextStyle.styleRegular24(context),
      ),
      subtitle: Text(
        'Share your surplus food',
        style: AppTextStyle.styleRegular16(
          context,
        ).copyWith(color: AppColors.greyTextColor),
      ),
    );
  }
}
