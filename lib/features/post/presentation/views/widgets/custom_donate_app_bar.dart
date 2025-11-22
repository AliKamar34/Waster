import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/features/post/domain/entity/enums/post_mode_enum.dart';

class CustomDonateAppBar extends StatelessWidget {
  const CustomDonateAppBar({super.key, required this.postMode});
  final PostMode postMode;
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
        postMode == PostMode.create
            ? LocaleKeys.post_food_donation.tr()
            : LocaleKeys.edit_food_donation.tr(),
        style: AppTextStyle.styleRegular24(context),
      ),
      subtitle: Text(
        LocaleKeys.share_surplus_food.tr(),
        style: AppTextStyle.styleRegular16(context).copyWith(
          color: Theme.of(context).extension<AppColors>()!.greyTextColor,
        ),
      ),
    );
  }
}
