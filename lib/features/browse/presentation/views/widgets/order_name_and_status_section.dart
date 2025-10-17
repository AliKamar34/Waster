import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_order_state_widget.dart';

class OrderNameAndStatusSection extends StatelessWidget {
  const OrderNameAndStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.fresh_sandwiches_pastries.tr(),
                style: AppTextStyle.styleRegular16(context),
              ),
              Text('OrderORD-001', style: AppTextStyle.styleRegular14(context)),
            ],
          ),
        ),
        CustomOrderStateWidget(
          color: Theme.of(context).extension<AppColors>()!.primaryColor,
          state: LocaleKeys.in_transit.tr(),
        ),
      ],
    );
  }
}
