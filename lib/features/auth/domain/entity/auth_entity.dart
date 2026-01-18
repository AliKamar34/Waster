import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String token;
  final String refreshToken;
  final String email;
  final String userName;
  final List<String> roles;
  final DateTime expiresOn;
  final String? message;
  const AuthEntity({
    required this.token,
    required this.refreshToken,
    required this.email,
    required this.userName,
    required this.roles,
    required this.expiresOn,
    this.message,
  });

  @override
  List<Object?> get props => [
    token,
    refreshToken,
    email,
    userName,
    roles,
    expiresOn,
    message,
  ];

  @override
  bool get stringify => true;
}
