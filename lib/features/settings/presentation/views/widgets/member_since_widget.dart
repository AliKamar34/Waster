import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class MembersinceWidget extends StatelessWidget {
  const MembersinceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              LocaleKeys.member_since.tr(),
              style: AppTextStyle.styleRegular14(context),
            ),
          ),
          Center(
            child: Text(
              '${LocaleKeys.mar.tr()} 2024',
              style: AppTextStyle.styleRegular16(context),
            ),
          ),
        ],
      ),
    );
  }
}
