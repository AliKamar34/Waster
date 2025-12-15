import 'package:waster/features/claim/domain/entity/claim_user_entity.dart';

class ClaimUserModel extends ClaimUserEntity {
  ClaimUserModel({
    required super.id,
    required super.userName,
    required super.fullName,
    required super.email,
    required super.phoneNumber,
    required super.address,
    super.city,
    super.profilePicture,
  });

  factory ClaimUserModel.fromJson(Map<String, dynamic> json) {
    return ClaimUserModel(
      id: json['id'],
      userName: json['userName'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      city: json['city'],
      profilePicture: json['profilePicture'],
    );
  }
}
