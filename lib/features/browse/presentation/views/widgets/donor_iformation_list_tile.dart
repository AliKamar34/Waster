import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class DonorIformationListTile extends StatelessWidget {
  const DonorIformationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.primaryColor,
        child: Text('SB'),
      ),
      title: Row(
        children: [
          Text(
            'Sunshine Bakery',
            style: AppTextStyle.styleRegular14(
              context,
            ).copyWith(color: AppColors.blackTextColor),
          ),
          CustomContainer(
            padding: 2,
            borderRadius: 8,
            backgroundColor: AppColors.orangeColor,
            child: Text(
              'Verified',
              style: AppTextStyle.styleRegular14(
                context,
              ).copyWith(color: AppColors.whiteColor),
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 18),
          Text('4.9', style: AppTextStyle.styleRegular14(context)),
        ],
      ),
    );
  }
}
