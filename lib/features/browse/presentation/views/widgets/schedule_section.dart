import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/utils/date_formatter.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/schedule_list_tile.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({super.key, required this.postEntity});
  final PostEntity postEntity;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.schedule.tr(),
            style: AppTextStyle.styleRegular16(context),
          ),
          ScheduleListTile(
            title: LocaleKeys.posted.tr(),
            time: DateFormatter.formatRelative(postEntity.created, context),
          ),
          const Divider(),
          ScheduleListTile(
            title: LocaleKeys.Expires.tr(),
            time: DateFormatter.formatRelative(postEntity.expiresOn, context),
          ),
        ],
      ),
    );
  }
}
