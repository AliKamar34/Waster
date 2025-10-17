import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_list_tile.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: LocaleKeys.account.tr(),
      children: [
        CustomSettingsListTile(
          onTap: () {
            context.pushNamed(AppRoutes.profileEditingView);
          },
          icon: Assets.profile,
          title: LocaleKeys.profile_editing.tr(),
          subtitle: LocaleKeys.Update_your_personal_information.tr(),
          trailing: const RotatedBox(
            quarterTurns: 2,
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      ],
    );
  }
}
