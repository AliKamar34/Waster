import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/schedule_list_tile.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({super.key});

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
            title: LocaleKeys.pickup_time.tr(),
            time:
                '${LocaleKeys.to_day.tr()}, 4:00 ${LocaleKeys.pm.tr()} - 6:00 ${LocaleKeys.pm.tr()}',
          ),
          const Divider(),
          ScheduleListTile(
            title: LocaleKeys.delivery_window.tr(),
            time:
                'Today, 7:00 ${LocaleKeys.pm.tr()} - 8:00 ${LocaleKeys.pm.tr()}',
          ),
        ],
      ),
    );
  }
}
