import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_near_orders_widget.dart';

class AvailableNearYouSection extends StatelessWidget {
  const AvailableNearYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.available_near_you.tr(),
          style: AppTextStyle.styleRegular18(context),
        ),
        const CustomNearOrdersWidget(),
        const CustomNearOrdersWidget(),
        const CustomNearOrdersWidget(),
        const CustomNearOrdersWidget(),
      ],
    );
  }
}
