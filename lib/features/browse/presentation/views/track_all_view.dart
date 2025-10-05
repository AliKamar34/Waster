import 'package:flutter/material.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_my_orders_app_bar.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_traking_order_details_container.dart';

class TrackAllView extends StatelessWidget {
  const TrackAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          spacing: 16,
          children: [
            CustomMyOrdersAppBar(),
            CustomTrakingOrderDetailsContainer(),
          ],
        ),
      ),
    );
  }
}
