import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_list_tile.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsContainer(
      title: 'Account',
      children: [
        CustomSettingsListTile(
          onTap: () {
            context.pushNamed(AppRoutes.profileEditingView);
          },
          icon: Assets.profile,
          title: 'Edit Profile',
          subtitle: 'Update your personal information',
          trailing: const RotatedBox(
            quarterTurns: 2,
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      ],
    );
  }
}
