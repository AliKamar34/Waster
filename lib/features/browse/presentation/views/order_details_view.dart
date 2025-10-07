import 'package:flutter/material.dart';
import 'package:waster/features/browse/presentation/views/widgets/contact_information_widget.dart';
import 'package:waster/features/browse/presentation/views/widgets/items_available_section.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_details_app_bar.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_summary_section.dart';
import 'package:waster/features/browse/presentation/views/widgets/schedule_section.dart';
import 'package:waster/features/browse/presentation/views/widgets/special_instructions_section.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              OrderDetailsAppBar(),
              OrderSummarySection(),
              ItemsAvailableSection(),
              ContactInformationWidget(
                title: 'Donor Information',
                location: '123 Main St, Downtown',
              ),
              ContactInformationWidget(
                title: 'Recipient Information',
                location: '456 Oak Ave, Community Center',
              ),
              ScheduleSection(),
              SpecialInstructionsSection(),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
