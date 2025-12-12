import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/helpers/shared_prefs_helper.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_profile_dialog.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_view_body_bloc_builder.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool hasShownDialog = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is UserDetailsLoaded && !hasShownDialog) {
            _checkAndShowCompleteProfileDialog(context, state);
          }
        },
        child: const SingleChildScrollView(
          child: Column(
            spacing: 24,
            children: [
              CustomProfileAppBar(),
              ProfileViewBodyBlocBuilder(),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  void _checkAndShowCompleteProfileDialog(
    BuildContext context,
    UserDetailsLoaded state,
  ) {
    final hasIncompleteProfile =
        state.user.address == null || state.user.phoneNumber == null;
    final shouldShow = SharedPrefsHelper.shouldShowProfileReminder();
    if (hasIncompleteProfile && shouldShow) {
      hasShownDialog = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _showCompleteProfileDialog(context, state);
        }
      });
    }
  }

  void _showCompleteProfileDialog(
    BuildContext context,
    UserDetailsLoaded state,
  ) {
    showCompleteProfileDialogWithAnimation(
      context,
      onCompleteNow: () {
        context.pop();
        context.pushNamed(
          AppRoutes.profileEditingView,
          extra: {'bloc': context.read<SettingsBloc>(), 'user': state.user},
        );
      },
      onLater: () {
        SharedPrefsHelper.setProfileReminderDismissedTime();
        context.pop();
      },
    );
  }
}
