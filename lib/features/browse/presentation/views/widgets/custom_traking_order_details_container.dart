import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
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
    return const CustomContainer(
      child: Column(
        children: [
          OrderNameAndStatusSection(),
          SizedBox(height: 30),
          QuantityAndTimeSection(),
          SizedBox(height: 12),
          MyOrdersItemsSection(),
          CustomMyOrdersListTile(
            title: 'From',
            subtitle: '123 Main St',
            icon: Assets.location,
            iconColor: AppColors.greyTextColor,
          ),
          CustomMyOrdersListTile(
            title: 'Delivery',
            subtitle: '456 Oak Ave',
            icon: Assets.location,
            iconColor: AppColors.blueColor,
          ),
          CustomMyOrdersListTile(
            title: 'Driver',
            subtitle: 'Sarah Johnson',
            icon: Assets.truck,
            iconColor: AppColors.greyTextColor,
          ),
          Divider(color: AppColors.borderColor),
          CustomOrderCallingInfoSection(),
        ],
      ),
    );
  }
}
