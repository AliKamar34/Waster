import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class SpecialInstructionsSection extends StatelessWidget {
  const SpecialInstructionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.special_instructions.tr(),
            style: AppTextStyle.styleRegular18(context),
          ),
          Text(
            LocaleKeys.Please_bring_insulated_bags_Items_need_to_be_refr.tr(),
            style: AppTextStyle.styleRegular14(context),
          ),
        ],
      ),
    );
  }
}
