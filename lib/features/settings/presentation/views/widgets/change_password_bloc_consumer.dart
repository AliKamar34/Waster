import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/utils/show_overlay_toast.dart';
import 'package:waster/core/widgets/custom_loading_indicator.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';

class ChangeUserSecretsBlocConsumer extends StatelessWidget {
  const ChangeUserSecretsBlocConsumer({
    super.key,
    required this.bottomContext,
    required this.child,
  });
  final BuildContext bottomContext;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsFailure) {
          showOverlayToast(bottomContext, state.message, isError: true);
        } else if (state is SettingsUpdateSuccess) {
          context.pop();
        }
      },
      builder: (context, state) {
        return CustomLoadinIndicator(
          isLoading: state is SettingsLoading ? true : false,
          child: child,
        );
      },
    );
  }
}
