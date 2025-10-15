import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_light_color_container.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_order_state_widget.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    super.key,
    required this.isRead,
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    required this.badge,
    required this.badgeColor,
    this.onDelete,
  });

  final bool isRead;
  final String icon;
  final String title;
  final String description;
  final String time;
  final String badge;
  final Color badgeColor;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return CustomLightColorContainer(
      color: isRead
          ? Colors.blueGrey.shade200
          : Theme.of(context).extension<AppColors>()!.blueColor,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 10,
            children: [
              SvgPicture.asset(icon, width: 24),
              Expanded(
                child: Text(title, style: AppTextStyle.styleRegular16(context)),
              ),
              CustomOrderStateWidget(color: badgeColor, state: badge),
            ],
          ),
          Text(
            description,
            style: AppTextStyle.styleRegular14(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: AppTextStyle.styleRegular14(
                  context,
                ).copyWith(color: Colors.grey),
              ),
              GestureDetector(
                onTap: onDelete,
                child: SvgPicture.asset(Assets.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
