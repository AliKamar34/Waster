import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:waster/features/auth/presentation/views/widgets/custom_auth_loading_indicator.dart';
import 'package:waster/features/auth/presentation/views/widgets/log_in_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            GoRouter.of(context).pushReplacement(AppRoutes.mainView);
            showToast(context, 'Log in successful');
          } else if (state is AuthFailure) {
            showToast(context, state.message, isError: true);
          }
        },
        builder: (context, state) {
          return CustomAuthLoadinIndicator(
            isLoading: state is AuthLoading ? true : false,
            child: const LogInViewBody(),
          );
        },
      ),
    );
  }
}
/*
I/flutter (13956):  x-powered-by: ASP.NET
I/flutter (13956):  content-type: application/json; charset=utf-8
I/flutter (13956):  date: Mon, 03 Nov 2025 15:53:56 GMT
I/flutter (13956):  transfer-encoding: chunked
I/flutter (13956):  server: Microsoft-IIS/10.0
I/flutter (13956): Response Text:
I/flutter (13956): {"message":"Email or Password is Incorrect!"}
2
I/flutter (13956): 
I/flutter (13956): Transition { currentState: AuthLoading(), event: LoginEvent(alikamar@gmail.com, 12345@ALIl), nextState: AuthFailure(Exception: Received invalid status code: 400) }
I/flutter (13956): Change { currentState: AuthLoading(), nextState: AuthFailure(Exception: Received invalid status code: 400) }
I/flutter (13956): done Instance of 'AuthBloc' */