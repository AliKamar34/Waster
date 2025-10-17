import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_traking_order_details_container.dart';

class TrackAllView extends StatelessWidget {
  const TrackAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          spacing: 16,
          children: [
            CustomAppBar(title: LocaleKeys.My_Orders.tr(), needSpace: true),
            const CustomTrakingOrderDetailsContainer(),
          ],
        ),
      ),
    );
  }
}
