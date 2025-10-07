import 'package:flutter/material.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_stats_row.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_tags_list_view.dart';
import 'package:waster/features/browse/presentation/views/widgets/oreder_name_and_details_widget.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomContainer(
      child: Column(
        spacing: 24,
        children: [
          OrederNameAndDetailsWidget(),
          OrderStatsRow(),
          OrderTagsListView(),
        ],
      ),
    );
  }
}
