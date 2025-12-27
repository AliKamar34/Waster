import 'package:waster/features/claim/domain/entity/claim_user_entity.dart';

class ClaimUserModel extends ClaimUserEntity {
  final String id;
  final String userName;
  final String? city;
  ClaimUserModel({
    required this.id,
    required this.userName,
    required super.fullName,
    required super.email,
    required super.phoneNumber,
    required super.address,
    this.city,
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
