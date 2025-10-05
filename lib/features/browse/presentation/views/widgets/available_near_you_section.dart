import 'package:flutter/material.dart';
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
        Text('Available Near You', style: AppTextStyle.styleRegular18(context)),
        const CustomNearOrdersWidget(),
        const CustomNearOrdersWidget(),
        const CustomNearOrdersWidget(),
        const CustomNearOrdersWidget(),
      ],
    );
  }
}
