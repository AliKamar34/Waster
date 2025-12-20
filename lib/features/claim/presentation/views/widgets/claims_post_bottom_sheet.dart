import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';

class ClaimsPostBottomSheet extends StatelessWidget {
  const ClaimsPostBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.5,
      builder: (context, scroll) => Column(
        children: [
          Center(
            child: Container(
              width: 80,
              height: 5,
              margin: const EdgeInsets.only(top: 16, bottom: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).extension<AppColors>()!.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: scroll,
              itemCount: 4,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: CustomContainer(
                    child: Column(
                      children: [
                        DonorIformationListTile(),
                        ClaimedPostActions(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DonorIformationListTile extends StatelessWidget {
  const DonorIformationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 22.r,
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
            padding: 2.w,
            borderRadius: 6.r,
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
          Icon(Icons.star, color: Colors.amber, size: 18.sp),
          Text('4.9', style: AppTextStyle.styleRegular14(context)),
        ],
      ),
      trailing: InkWell(
        onTap: () {},
        child: CustomContainer(
          padding: 8.w,
          child: SvgPicture.asset(Assets.phone),
        ),
      ),
    );
  }
}

class ClaimedPostActions extends StatelessWidget {
  const ClaimedPostActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          flex: 11,
          child: CustomButton(
            backgroundColor: Theme.of(
              context,
            ).extension<AppColors>()!.primaryColor,
            title: 'Approve',
            onPressed: () {},
          ),
        ),
        Expanded(
          flex: 10,
          child: CustomButton(
            backgroundColor: Theme.of(context).extension<AppColors>()!.redColor,
            title: 'Reject',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
