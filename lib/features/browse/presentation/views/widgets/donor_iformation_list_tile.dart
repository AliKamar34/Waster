import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class DonorIformationListTile extends StatelessWidget {
  const DonorIformationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Theme.of(context).extension<AppColors>()!.primaryColor,
        child: const Text('SB'),
      ),
      title: Row(
        children: [
          Text(
            'Sunshine Bakery',
            style: AppTextStyle.styleRegular14(context).copyWith(
              color: Theme.of(context).extension<AppColors>()!.blackTextColor,
            ),
          ),
          CustomContainer(
            padding: 2,
            borderRadius: 8,
            backgroundColor: Theme.of(
              context,
            ).extension<AppColors>()!.orangeColor,
            child: Text(
              LocaleKeys.verified.tr(),
              style: AppTextStyle.styleRegular14(context).copyWith(
                color: Theme.of(context).extension<AppColors>()!.whiteColor,
              ),
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
      trailing: InkWell(
        onTap: () {},
        child: CustomContainer(
          padding: 8,
          child: SvgPicture.asset(Assets.phone),
        ),
      ),
    );
  }
}
