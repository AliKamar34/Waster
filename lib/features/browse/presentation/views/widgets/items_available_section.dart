import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_items_available_lite_tile.dart';

class ItemsAvailableSection extends StatelessWidget {
  const ItemsAvailableSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Items Available', style: AppTextStyle.styleRegular16(context)),
          const SizedBox(height: 20),
          const CustomItemsAvailableLiteTile(
            title: 'Croissants',
            subtitle: 'Tomorrow',
            count: '24 pices',
          ),
          const CustomItemsAvailableLiteTile(
            title: 'Sourdough Bread',
            subtitle: '2 days',
            count: '8 loaves',
          ),
          const CustomItemsAvailableLiteTile(
            title: 'Muffins',
            subtitle: 'Tomorrow',
            count: '36 pieces',
          ),
          const CustomItemsAvailableLiteTile(
            title: 'Cookies',
            subtitle: '3 days',
            count: '60 pieces',
          ),
        ],
      ),
    );
  }
}
