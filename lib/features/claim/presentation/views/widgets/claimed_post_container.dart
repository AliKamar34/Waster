import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/utils/date_formatter.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/claim/domain/entity/claim_entity.dart';
import 'package:waster/features/claim/presentation/manager/cubit/claim_cubit.dart';
import 'package:waster/features/claim/presentation/views/widgets/claimed_post_actions.dart';
import 'package:waster/features/claim/presentation/views/widgets/claimed_post_text_info.dart';
import 'package:waster/features/claim/presentation/views/widgets/claimed_post_title_and_status_section.dart';

class ClaimedPostContainer extends StatelessWidget {
  const ClaimedPostContainer({super.key, required this.claimEntity});
  final ClaimEntity claimEntity;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClaimedPostTitleAndStatusSection(claimPostEntity: claimEntity.post),
          Text(
            claimEntity.post.description,
            style: AppTextStyle.styleRegular16(context),
          ),
          ClaimedPostTextInfo(
            infoTitle: LocaleKeys.Location.tr(),
            infoData: claimEntity.post.location,
          ),
          ClaimedPostTextInfo(
            infoTitle: LocaleKeys.Expires.tr(),
            infoData: DateFormatter.formatRelative(
              claimEntity.post.expiryDate,
              context,
            ),
          ),
          ClaimedPostTextInfo(
            infoTitle: LocaleKeys.claimedAt.tr(),
            infoData: DateFormatter.formatRelative(
              claimEntity.claimedAt,
              context,
            ),
          ),
          ClaimedPostActions(
            showOwnerInfo: () {},
            onCancle: () =>
                context.read<ClaimCubit>().cancleClaim(claimEntity.id),
          ),
        ],
      ),
    );
  }
}
