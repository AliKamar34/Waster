import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/core/widgets/custom_loading_indicator.dart';
import 'package:waster/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/settings/presentation/views/widgets/app_prefrences_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_log_out_container.dart';
import 'package:waster/features/settings/presentation/views/widgets/notifications_settings_section.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthUnauthenticated) {
              context.pushReplacementNamed(AppRoutes.login);
              showToast(context, 'Loged Out Successfully');
            } else if (state is AuthFailure) {
              showToast(context, state.message, isError: true);
            }
          },
          builder: (context, state) {
            return CustomLoadinIndicator(
              isLoading: state is AuthLoading ? true : false,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16,
                  children: [
                    CustomAppBar(title: LocaleKeys.settings.tr()),
                    const NotificationsSettingsSection(),
                    const AppPrefrencesSection(),
                    const CustomLogOutContainer(),
                    const SizedBox(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
