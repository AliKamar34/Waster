import 'package:waster/features/auth/domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.token,
    required super.refreshToken,
    required super.email,
    required super.userName,
    required super.roles,
    required super.expiresOn,
    super.message,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      expiresOn: DateTime.parse(json['expiresOn'] as String),
      message: json['message'] as String?,
    );
  }
}
