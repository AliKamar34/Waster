import 'package:flutter/material.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_container.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_settings_list_tile.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSettingsContainer(
      title: 'Account',
      children: [
        CustomSettingsListTile(
          icon: Assets.profile,
          title: 'Edit Profile',
          subtitle: 'Update your personal information',
          trailing: RotatedBox(
            quarterTurns: 2,
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      ],
    );
  }
}
