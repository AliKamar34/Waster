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
      id: json['items']['id'] as String,
      fullName: json['items']['fullName'] as String,
      email: json['items']['email'] as String,
      address: json['items']['address'] ?? 'no address provided',
      phoneNumber: json['items']['phoneNumber'] ?? '0000000000',
      bio: json['items']['bio'] ?? 'no bio provided',
    );
  }
}
