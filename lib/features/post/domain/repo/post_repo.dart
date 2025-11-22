import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/models/paginated_response_model.dart';
import 'package:waster/core/models/post_model.dart';

abstract class PostRepo {
  Future<Either<Failure, void>> addDonationPost({
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
  Future<Either<Failure, void>> editDonationPost({
    required String id,
    required String title,
    required String description,
    required String quantity,
    required String unit,
    required String pickupLocation,
    required DateTime expiresOn,
    required String category,
    required String? imageType,
    required String? imageData,
  });
  Future<Either<Failure, PaginatedResponse<PostModel>>> getAllUsersPosts({
    required int pageNum,
    int pageSize = 10,
  });
  Future<Either<Failure, void>> deletePost({required String id});
}
