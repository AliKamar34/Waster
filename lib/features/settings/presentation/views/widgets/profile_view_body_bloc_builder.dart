import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';
import 'package:waster/features/settings/presentation/views/widgets/contact_info_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_profile_loading_widget.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_header_card.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_statistics_section.dart';

class ProfileViewBodyBlocBuilder extends StatelessWidget {
  const ProfileViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is UserDetailsLoaded) {
          return Column(
            spacing: 24,
            children: [
              ProfileHeaderCard(user: state.user),
              const ProfileStatisticsSection(),
              ContactInfoSection(
                email: state.user.email,
                phoneNum: state.user.phoneNumber,
              ),
              CustomButton(title: 'My Posts', onPressed: () {}),
              CustomButton(title: 'Book Marks', onPressed: () {}),
            ],
          );
        } else if (state is SettingsLoading) {
          return const CustomProfileLoadingWidget();
        } else if (state is SettingsFailure) {
          return Text(state.message);
        } else {
          return const Text('state  is initial');
        }
      },
    );
  }
}
