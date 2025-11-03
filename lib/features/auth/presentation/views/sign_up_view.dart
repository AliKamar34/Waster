import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:waster/features/auth/presentation/views/widgets/custom_auth_loading_indicator.dart';
import 'package:waster/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            GoRouter.of(context).pushReplacement(AppRoutes.mainView);
            showToast(context, state.authEntity.message.toString());
          } else if (state is AuthFailure) {
            showToast(context, state.message, isError: true);
          }
        },
        builder: (context, state) {
          return CustomAuthLoadinIndicator(
            isLoading: state is AuthLoading ? true : false,
            child: const SignUpViewBody(),
          );
        },
      ),
    );
  }
}
