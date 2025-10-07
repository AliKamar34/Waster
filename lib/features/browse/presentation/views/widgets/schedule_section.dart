import 'package:flutter/material.dart';
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
          Text('Schedule', style: AppTextStyle.styleRegular16(context)),
          const ScheduleListTile(
            title: 'Pickup Time',
            time: 'Today, 4:00 PM - 6:00 PM',
          ),
          const Divider(),
          const ScheduleListTile(
            title: 'Delivery Window',
            time: 'Today, 7:00 PM - 8:00 PM',
          ),
        ],
      ),
    );
  }
}
