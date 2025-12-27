import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';

class ClaimedPostActions extends StatelessWidget {
  const ClaimedPostActions({super.key, this.showOwnerInfo, this.onCancle});
  final void Function()? showOwnerInfo;
  final void Function()? onCancle;
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
            ).extension<AppColors>()!.blueColor,
            title: LocaleKeys.ownerInfo.tr(),
            onPressed: showOwnerInfo,
          ),
        ),
        Expanded(
          flex: 10,
          child: CustomButton(
            backgroundColor: Theme.of(context).extension<AppColors>()!.redColor,
            title: LocaleKeys.cancle.tr(),
            onPressed: onCancle,
          ),
        ),
      ],
    );
  }
}
