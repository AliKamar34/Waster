import 'package:dartz/dartz.dart';
import 'package:waster/core/data/base_repository.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/models/paginated_response_model.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/post/data/datasource/post_remote_data_source.dart';
import 'package:waster/features/post/domain/repo/post_repo.dart';

class PostRepoImpl extends BaseRepository implements PostRepo {
  final PostRemoteDataSource postRemoteDataSource;

  PostRepoImpl({required this.postRemoteDataSource});
  @override
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
  }) async {
    return execute(
      () => postRemoteDataSource.addDonationPost(
        title: title,
        description: description,
        quantity: quantity,
        unit: unit,
        pickupLocation: pickupLocation,
        expiresOn: expiresOn,
        category: category,
        imageType: imageType,
        imageData: imageData,
      ),
    );
  }

  @override
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
  }) async {
    return execute(
      () => postRemoteDataSource.editDonationPost(
        id: id,
        title: title,
        description: description,
        quantity: quantity,
        unit: unit,
        pickupLocation: pickupLocation,
        expiresOn: expiresOn,
        category: category,
        imageType: imageType,
        imageData: imageData,
      ),
    );
  }

  @override
  Future<Either<Failure, PaginatedResponse<PostModel>>> getAllUsersPosts({
    required int pageNum,
    int pageSize = 10,
  }) async {
    return execute(
      () => postRemoteDataSource.getAllUsersPosts(
        pageNum: pageNum,
        pageSize: pageSize,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> deletePost({required String id}) async {
    return execute(() => postRemoteDataSource.deletePost(id: id));
  }

  @override
  Future<Either<Failure, void>> addBookMarkPost({required String id}) async {
    return execute(() => postRemoteDataSource.addBookMarkPost(id: id));
  }

  @override
  Future<Either<Failure, void>> deleteBookMarkPost({required String id}) {
    return execute(() => postRemoteDataSource.deleteBookMarkPost(id: id));
  }

  @override
  Future<Either<Failure, PaginatedResponse<PostModel>>> getAllBookMarksPosts({
    required int pageNum,
    int pageSize = 10,
  }) async {
    return execute(
      () => postRemoteDataSource.getAllBookMarksPosts(
        pageNum: pageNum,
        pageSize: pageSize,
      ),
    );
  }
}
