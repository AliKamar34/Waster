import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_order_state_widget.dart';

class CustomOrderDetailContainer extends StatelessWidget {
  const CustomOrderDetailContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.state,
    required this.count,
    required this.to,
    required this.time,
    required this.color,
  });
  final String title, icon, state, count, to, time;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 4,
            children: [
              Text(title, style: AppTextStyle.styleRegular16(context)),
              SvgPicture.asset(icon),
              const Spacer(),
              CustomOrderStateWidget(color: color, state: state),
            ],
          ),
          Text(count, style: AppTextStyle.styleRegular14(context)),
          Text(
            '${LocaleKeys.to.tr()} $to',
            style: AppTextStyle.styleRegular14(context),
          ),
          Text(time, style: AppTextStyle.styleRegular14(context)),
        ],
      ),
    );
  }
}
