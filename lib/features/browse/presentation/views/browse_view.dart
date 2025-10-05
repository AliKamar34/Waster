import 'package:flutter/material.dart';
import 'package:waster/features/browse/presentation/views/widgets/accepted_orders_section.dart';
import 'package:waster/features/browse/presentation/views/widgets/available_near_you_section.dart';
import 'package:waster/features/browse/presentation/views/widgets/browse_count_section.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_browse_app_bar.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_filters_section.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          spacing: 24,
          children: [
            CustomBrowseAppBar(),
            CustomFiltersSection(),
            BrowseCountSection(),
            AcceptedOrdersSection(),
            AvailableNearYouSection(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
