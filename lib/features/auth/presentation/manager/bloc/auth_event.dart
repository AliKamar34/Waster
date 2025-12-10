part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

final class RegisterEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;
  final String address;

  const RegisterEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
    required this.address,
  });

  @override
  List<Object> get props => [
    firstName,
    lastName,
    email,
    password,
    confirmPassword,
    phoneNumber,
    address,
  ];
}

final class RefreshTokenEvent extends AuthEvent {
  const RefreshTokenEvent();
}

final class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

final class GoogleSignInEvent extends AuthEvent {
  const GoogleSignInEvent();
}
