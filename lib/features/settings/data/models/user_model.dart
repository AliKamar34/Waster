import 'package:waster/features/settings/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final String id;

  const UserModel({
    required this.id,
    required super.fullName,
    required super.email,
    required super.address,
    required super.phoneNumber,
    required super.bio,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['data']['id'] as String,
      fullName: json['data']['fullName'] as String,
      email: json['data']['email'] as String,
      address: json['data']['address'] ?? 'no address provided',
      phoneNumber: json['data']['phoneNumber'] ?? '0000000000',
      bio: json['data']['bio'] ?? 'no bio provided',
    );
  }
}
