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
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      bio: json['bio'],
    );
  }
}
