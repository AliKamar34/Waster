import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/usecases/use_cases.dart';
import 'package:waster/features/auth/domain/entity/auth_entity.dart';
import 'package:waster/features/auth/domain/usecases/log_in_use_case.dart';
import 'package:waster/features/auth/domain/usecases/refresh_token_use_case.dart';
import 'package:waster/features/auth/domain/usecases/register_use_case.dart';
import 'package:waster/features/auth/domain/usecases/revoke_token_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogInUseCase logInUseCase;
  final RegisterUseCase registerUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;
  final RevokeTokenUseCase revokeTokenUseCase;
  AuthBloc({
    required this.logInUseCase,
    required this.registerUseCase,
    required this.refreshTokenUseCase,
    required this.revokeTokenUseCase,
  }) : super(const AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
    on<RegisterEvent>(_onRegisterEvent);
    on<RefreshTokenEvent>(_onRefreshTokenEvent);
    on<LogoutEvent>(_onLogoutEvent);
  }
  Future<void> _onLoginEvent(event, emit) async {
    emit(const AuthLoading());
    final result = await logInUseCase.call(
      LogInParams(email: event.email, password: event.password),
    );
    result.fold(
      (failure) {
        emit(AuthFailure(failure.message));
      },
      (authEntity) {
        emit(AuthSuccess(authEntity));
      },
    );
  }

  Future<void> _onRegisterEvent(event, emit) async {
    emit(const AuthLoading());
    final result = await registerUseCase.call(
      RegisterParams(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
        confirmPassword: event.confirmPassword,
      ),
    );
    result.fold(
      (failure) {
        emit(AuthFailure(failure.message));
      },
      (authEntity) {
        emit(AuthSuccess(authEntity));
      },
    );
  }

  Future<void> _onRefreshTokenEvent(event, emit) async {
    emit(const AuthLoading());
    final result = await refreshTokenUseCase.call(NoParams());
    result.fold(
      (failure) {
        emit(AuthFailure(failure.message));
      },
      (authEntity) {
        emit(AuthSuccess(authEntity));
      },
    );
  }

  Future<void> _onLogoutEvent(event, emit) async {
    emit(const AuthLoading());
    final result = await revokeTokenUseCase.call(NoParams());
    result.fold(
      (failure) {
        emit(AuthFailure(failure.message));
      },
      (authEntity) {
        emit(const AuthUnauthenticated());
      },
    );
  }
}
