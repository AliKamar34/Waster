import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';
import 'package:waster/features/settings/presentation/views/widgets/contact_info_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_profile_loading_widget.dart';
import 'package:waster/features/settings/presentation/views/widgets/posts_managment_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_header_card.dart';

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
              ContactInfoSection(
                email: state.user.email,
                phoneNum:
                    state.user.phoneNumber ?? LocaleKeys.phone_number.tr(),
              ),
              const PostsManagmentSection(),
            ],
          );
        } else if (state is SettingsLoading) {
          return const CustomProfileLoadingWidget();
        } else if (state is SettingsFailure) {
          return Text(state.message);
        } else {
          BlocProvider.of<SettingsBloc>(
            context,
          ).add(const GetUserDetailsEvent());
          return const CustomProfileLoadingWidget();
        }
      },
    );
  }
}
