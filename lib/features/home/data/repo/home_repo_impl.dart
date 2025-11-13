import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/errors/server_exception.dart';
import 'package:waster/features/home/data/datasource/home_remote_data_source.dart';
import 'package:waster/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  const HomeRepoImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, void>> addDonationPost({
    required String title,
    required String description,
    required String quantity,
    required String unit,
    required String pickupLocation,
    required String expiresOn,
    required String category,
    required String imageType,
    required String imageData,
  }) async {
    try {
      final result = await homeRemoteDataSource.addDonationPost(
        title: title,
        description: description,
        quantity: quantity,
        unit: unit,
        pickupLocation: pickupLocation,
        expiresOn: expiresOn,
        category: category,
        imageType: imageType,
        imageData: imageData,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
