import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/widgets/custom_text_field.dart';
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
            CustomAppBar(title: LocaleKeys.Browse_Available_Orders.tr()),
            CustomTextField(
              prefixIcon: SvgPicture.asset(Assets.browse),
              hint: LocaleKeys.Search_by_food_type_or_donor_name.tr(),
            ),
            CustomTabBar(
              titles: [
                '${LocaleKeys.All_Orders.tr()} (6)',
                '${LocaleKeys.Urgent.tr()} (2)',
                '${LocaleKeys.Nearby.tr()} (2)',
                '${LocaleKeys.Large.tr()} (2)',
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
