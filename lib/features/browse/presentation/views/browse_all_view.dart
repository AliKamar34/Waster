import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_oreder_details_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_tab_bar.dart';

class BrowseAllView extends StatelessWidget {
  const BrowseAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          spacing: 16,
          children: [
            const CustomAppBar(title: 'Browse Available Orders'),
            CustomTextFeild(
              prefixIcon: SvgPicture.asset(Assets.browse),
              hint: 'Search by food type or donor name...',
            ),
            const CustomTabBar(
              titles: [
                'All Orders (6)',
                'Urgent (2)',
                'Nearby (2)',
                'Large (2)',
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 16),
                    child: CustomOrederDetailsContainer(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
