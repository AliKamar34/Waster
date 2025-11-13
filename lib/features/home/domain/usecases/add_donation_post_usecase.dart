import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/home/domain/repo/home_repo.dart';

class AddDonationPostParams extends Equatable {
  final String title;
  final String description;
  final String quantity;
  final String unit;
  final String pickupLocation;
  final String expiresOn;
  final String category;
  final String imageType;
  final String imageData;

  const AddDonationPostParams({
    required this.title,
    required this.description,
    required this.quantity,
    required this.unit,
    required this.pickupLocation,
    required this.expiresOn,
    required this.category,
    required this.imageType,
    required this.imageData,
  });

  @override
  List<Object?> get props => [
    title,
    description,
    quantity,
    unit,
    pickupLocation,
    expiresOn,
    category,
    imageType,
    imageData,
  ];
}

class AddDonationPostUsecase {
  final HomeRepo homeRepo;

  const AddDonationPostUsecase({required this.homeRepo});

  Future<Either<Failure, void>> call(AddDonationPostParams params) {
    return homeRepo.addDonationPost(
      title: params.title,
      description: params.description,
      quantity: params.quantity,
      unit: params.unit,
      pickupLocation: params.pickupLocation,
      expiresOn: params.expiresOn,
      category: params.category,
      imageType: params.imageType,
      imageData: params.imageData,
    );
  }
}
