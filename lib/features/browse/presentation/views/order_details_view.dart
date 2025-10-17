import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
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
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              const OrderDetailsAppBar(),
              const OrderSummarySection(),
              const ItemsAvailableSection(),
              ContactInformationWidget(
                title: LocaleKeys.Donor_Information.tr(),
                location: '123 Main St, Downtown',
              ),
              ContactInformationWidget(
                title: LocaleKeys.Recipient_Information.tr(),
                location: '456 Oak Ave, Community Center',
              ),
              const ScheduleSection(),
              const SpecialInstructionsSection(),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
