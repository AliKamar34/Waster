import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class ContactInfoSection extends StatelessWidget {
  const ContactInfoSection({
    super.key,
    required this.email,
    required this.phoneNum,
  });
  final String email, phoneNum;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.contact_information.tr(),
            style: AppTextStyle.styleRegular16(context),
          ),
          const SizedBox(height: 20),
          Row(
            spacing: 6,
            children: [
              SvgPicture.asset(Assets.email),
              Text(email, style: AppTextStyle.styleRegular16(context)),
            ],
          ),

          Row(
            spacing: 6,
            children: [
              SvgPicture.asset(Assets.phone),
              Text(phoneNum, style: AppTextStyle.styleRegular16(context)),
            ],
          ),
        ],
      ),
    );
  }
}
