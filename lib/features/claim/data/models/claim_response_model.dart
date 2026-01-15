import 'package:waster/features/claim/data/models/claim_model.dart';
import 'package:waster/features/claim/domain/entity/claim_response_entity.dart';

class ClaimResponseModel extends ClaimResponseEntity {
  ClaimResponseModel({
    required super.message,
    required super.claim,
    required this.isSuccess,
  });
  final bool isSuccess;
  factory ClaimResponseModel.fromJson(Map<String, dynamic> json) {
    return ClaimResponseModel(
      message: json['message'],
      isSuccess: json['claim']['isSuccess'],
      claim: ClaimModel.fromJson(json['claim']['value']),
    );
  }
}
