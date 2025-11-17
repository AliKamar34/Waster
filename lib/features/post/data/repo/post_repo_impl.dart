import 'package:dartz/dartz.dart';
import 'package:waster/core/data/base_repository.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/post/data/datasource/post_remote_data_source.dart';
import 'package:waster/features/post/domain/repo/post_repo.dart';

class PostRepoImpl extends BaseRepository implements PostRepo {
  final PostRemoteDataSource homeRemoteDataSource;

  PostRepoImpl({required this.homeRemoteDataSource});
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
      () => homeRemoteDataSource.addDonationPost(
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
    required String imageType,
    required String imageData,
  }) async {
    return execute(
      () => homeRemoteDataSource.editDonationPost(
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
}
