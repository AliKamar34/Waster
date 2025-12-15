import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/claim/presentation/views/widgets/claimed_post_actions.dart';
import 'package:waster/features/claim/presentation/views/widgets/claimed_post_text_info.dart';
import 'package:waster/features/claim/presentation/views/widgets/claimed_post_title_and_status_section.dart';

class ClaimedPostContainer extends StatelessWidget {
  const ClaimedPostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClaimedPostTitleAndStatusSection(),
          Text(
            'des klhjgfkhfiojhgfkhgfdgfkdjgo9itrjlk;fjnhgklsjhgf;jhf;',
            style: AppTextStyle.styleRegular16(context),
          ),
          ClaimedPostTextInfo(
            infoTitle: LocaleKeys.Location.tr(),
            infoData: ' : fake location',
          ),
          ClaimedPostTextInfo(
            infoTitle: LocaleKeys.Expires.tr(),
            infoData: ' : 12/2/2025',
          ),
          ClaimedPostTextInfo(
            infoTitle: LocaleKeys.claimedAt.tr(),
            infoData: ' : 12/2/2025',
          ),
          const ClaimedPostActions(),
        ],
      ),
    );
  }
}
