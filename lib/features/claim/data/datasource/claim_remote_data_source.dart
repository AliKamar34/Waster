import 'package:waster/core/errors/server_exception.dart';
import 'package:waster/core/networking/api_end_points.dart';
import 'package:waster/core/networking/dio_helper.dart';
import 'package:waster/features/claim/data/models/claim_model.dart';
import 'package:waster/features/claim/data/models/claim_response_model.dart';

abstract class ClaimRemoteDataSource {
  Future<List<ClaimModel>> getUserClaims(String status);
  Future<ClaimResponseModel> claimPost({required String postId});
  Future<List<ClaimModel>> getPostClaims({required String postId});
  Future<void> approveClaim({required String claimId});
  Future<void> rejectClaim({required String claimId});
  Future<void> cancelClaim({required String claimId});
}

class ClaimRemoteDataSourceImpl implements ClaimRemoteDataSource {
  final DioHelper dioHelper;

  const ClaimRemoteDataSourceImpl({required this.dioHelper});

  @override
  Future<ClaimResponseModel> claimPost({required String postId}) async {
    try {
      final response = await dioHelper.postRequest(
        endPoint: ApiEndPoints.claimPost,
        queryParameters: {'postId': postId},
      );
      if (response.statusCode == 200) {
        return ClaimResponseModel.fromJson(response.data);
      }
      throw const ServerException(message: 'Failed to claim post');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<ClaimModel>> getUserClaims(String status) async {
    try {
      final response = await dioHelper.postRequest(
        endPoint: ApiEndPoints.myClaims,
        queryParameters: {'status': status},
      );
      if (response.statusCode == 200) {
        List<ClaimModel> claimListFromJson(List<dynamic> json) {
          return json.map((e) => ClaimModel.fromJson(e)).toList();
        }

        return claimListFromJson(response.data);
      }
      throw const ServerException(message: 'Failed to claim post');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<ClaimModel>> getPostClaims({required String postId}) async {
    try {
      final response = await dioHelper.postRequest(
        endPoint: ApiEndPoints.getPostClaims,
        queryParameters: {'postId': postId},
      );
      if (response.statusCode == 200) {
        List<ClaimModel> claimListFromJson(List<dynamic> json) {
          return json.map((e) => ClaimModel.fromJson(e)).toList();
        }

        return claimListFromJson(response.data);
      }
      throw const ServerException(message: 'Failed to get post claims');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> approveClaim({required String claimId}) async {
    try {
      final response = await dioHelper.postRequest(
        endPoint: ApiEndPoints.approveClaim,
        queryParameters: {'claimId': claimId},
      );
      if (response.statusCode == 200) {
        return response.data['message'];
      }
      throw const ServerException(message: 'Failed to approve post');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> cancelClaim({required String claimId}) async {
    try {
      final response = await dioHelper.postRequest(
        endPoint: ApiEndPoints.cancelClaim,
        queryParameters: {'claimId': claimId},
      );
      if (response.statusCode == 200) {
        return response.data['message'];
      }
      throw const ServerException(message: 'Failed to cancel post');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> rejectClaim({required String claimId}) async {
    try {
      final response = await dioHelper.postRequest(
        endPoint: ApiEndPoints.rejectClaim,
        queryParameters: {'claimId': claimId},
      );
      if (response.statusCode == 200) {
        return response.data['message'];
      }
      throw const ServerException(message: 'Failed to reject post');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
