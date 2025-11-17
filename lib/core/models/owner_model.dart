import 'package:waster/core/entity/owner_entity.dart';

class OwnerModel extends OwnerEntity {
  const OwnerModel({
    required super.id,
    required super.userName,
    required super.email,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
    );
  }
}
