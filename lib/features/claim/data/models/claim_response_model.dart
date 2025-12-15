import 'package:waster/features/claim/data/models/claim_model.dart';
import 'package:waster/features/claim/domain/entity/claim_response_entity.dart';

class ClaimResponseModel extends ClaimResponseEntity {
  ClaimResponseModel({required super.message, required super.claim});

  factory ClaimResponseModel.fromJson(Map<String, dynamic> json) {
    return ClaimResponseModel(
      message: json['message'],
      claim: ClaimModel.fromJson(json['claim']),
    );
  }
}
