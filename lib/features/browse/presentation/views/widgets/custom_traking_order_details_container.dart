import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_my_orders_list_tile.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_order_calling_info.dart';
import 'package:waster/features/browse/presentation/views/widgets/my_orders_items_section.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_name_and_status_section.dart';
import 'package:waster/features/browse/presentation/views/widgets/quantity_and_time_section.dart';

class CustomTrakingOrderDetailsContainer extends StatelessWidget {
  const CustomTrakingOrderDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          const OrderNameAndStatusSection(),
          SizedBox(height: 30.h),
          const QuantityAndTimeSection(),
          SizedBox(height: 12.h),
          const MyOrdersItemsSection(),
          CustomMyOrdersListTile(
            title: LocaleKeys.from.tr(),
            subtitle: '123 Main St',
            icon: Assets.location,
            iconColor: Theme.of(context).extension<AppColors>()!.greyTextColor,
          ),
          CustomMyOrdersListTile(
            title: LocaleKeys.delivery.tr(),
            subtitle: '456 Oak Ave',
            icon: Assets.location,
            iconColor: Theme.of(context).extension<AppColors>()!.blueColor,
          ),
          CustomMyOrdersListTile(
            title: LocaleKeys.Driver.tr(),
            subtitle: 'Sarah Johnson',
            icon: Assets.truck,
            iconColor: Theme.of(context).extension<AppColors>()!.greyTextColor,
          ),
          Divider(color: Theme.of(context).extension<AppColors>()!.borderColor),
          const CustomOrderCallingInfoSection(),
        ],
      ),
    );
  }
}
