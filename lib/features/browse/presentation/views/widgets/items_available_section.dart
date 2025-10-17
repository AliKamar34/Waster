import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
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
          Text(
            LocaleKeys.items_available.tr(),
            style: AppTextStyle.styleRegular16(context),
          ),
          const SizedBox(height: 20),
          const CustomItemsAvailableLiteTile(
            title: 'Croissants',
            subtitle: 'Tomorrow',
            count: '24 pices',
          ),
          CustomItemsAvailableLiteTile(
            title: 'Sourdough Bread',
            subtitle: '2 ${LocaleKeys.days.tr()}',
            count: '8 ${LocaleKeys.loaves.tr()}',
          ),
          CustomItemsAvailableLiteTile(
            title: 'Muffins',
            subtitle: LocaleKeys.Tomorrow.tr(),
            count: '36 ${LocaleKeys.pieces.tr()}',
          ),
          CustomItemsAvailableLiteTile(
            title: 'Cookies',
            subtitle: '3 ${LocaleKeys.days.tr()}',
            count: '60 ${LocaleKeys.pieces.tr()}',
          ),
        ],
      ),
    );
  }
}
