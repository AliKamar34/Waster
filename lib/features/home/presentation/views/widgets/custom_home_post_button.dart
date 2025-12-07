import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/features/post/domain/entity/enums/post_mode_enum.dart';

class CustomHomePostButton extends StatelessWidget {
  const CustomHomePostButton({super.key, required bool showPostButton})
    : _showPostButton = showPostButton;

  final bool _showPostButton;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _showPostButton
          ? CustomButton(
              key: const ValueKey('post_button'),
              title: LocaleKeys.post_food_donation.tr(),
              onPressed: () {
                context.pushNamed(
                  AppRoutes.donateView,
                  extra: {'postMode': PostMode.create, 'post': null},
                );
              },
            )
          : const SizedBox.shrink(key: ValueKey('empty')),
    );
  }
}
