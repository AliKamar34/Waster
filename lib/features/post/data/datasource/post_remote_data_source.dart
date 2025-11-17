import 'package:waster/core/errors/server_exception.dart';
import 'package:waster/core/networking/api_end_points.dart';
import 'package:waster/core/networking/dio_helper.dart';
import 'package:waster/features/post/data/models/create_post_model.dart';

abstract class PostRemoteDataSource {
  Future<void> addDonationPost({
    required String title,
    required String description,
    required String quantity,
    required String unit,
    required String pickupLocation,
    required DateTime expiresOn,
    required String category,
    required String imageType,
    required String imageData,
  });
  Future<void> editDonationPost({
    required String id,
    required String title,
    required String description,
    required String quantity,
    required String unit,
    required String pickupLocation,
    required DateTime expiresOn,
    required String category,
    required String imageType,
    required String imageData,
  });
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final DioHelper dioHelper;

  const PostRemoteDataSourceImpl({required this.dioHelper});
  @override
  Future<void> addDonationPost({
    required String title,
    required String description,
    required String quantity,
    required String unit,
    required String pickupLocation,
    required DateTime expiresOn,
    required String category,
    required String imageType,
    required String imageData,
  }) async {
    try {
      final response = await dioHelper.postRequest(
        endPoint: ApiEndPoints.createPost,
        data: CreatePostModel(
          title: title,
          description: description,
          quantity: quantity,
          unit: unit,
          pickupLocation: pickupLocation,
          expiresOn: expiresOn,
          category: category,
          imageType: imageType,
          imageData: imageData,
        ).toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) return;
      throw const ServerException(message: 'Failed to add donation post');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> editDonationPost({
    required String id,
    required String title,
    required String description,
    required String quantity,
    required String unit,
    required String pickupLocation,
    required DateTime expiresOn,
    required String category,
    required String imageType,
    required String imageData,
  }) async {
    try {
      final response = await dioHelper.putRequest(
        endPoint: ApiEndPoints.editPost,
        queryParameters: {'id': id},
        data: CreatePostModel(
          title: title,
          description: description,
          quantity: quantity,
          unit: unit,
          pickupLocation: pickupLocation,
          expiresOn: expiresOn,
          category: category,
          imageType: imageType,
          imageData: imageData,
        ).toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) return;
      throw const ServerException(message: 'Failed to edit donation post');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
