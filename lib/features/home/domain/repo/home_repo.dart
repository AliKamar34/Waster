import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';

abstract class HomeRepo {
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
  });
  Future<Either<Failure, void>> editDonationPost({
    required String id,
    required String title,
    required String description,
    required String quantity,
    required String unit,
    required String pickupLocation,
    required String expiresOn,
    required String category,
    required String imageType,
    required String imageData,
  });
}
