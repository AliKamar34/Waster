class AuthEntity {
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
}
