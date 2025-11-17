import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/post/domain/repo/post_repo.dart';

class EditDonationPostParams extends Equatable {
  final String id;
  final String title;
  final String description;
  final String quantity;
  final String unit;
  final String pickupLocation;
  final DateTime expiresOn;
  final String category;
  final String imageType;
  final String imageData;

  const EditDonationPostParams({
    required this.id,
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
    id,
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

class EditDonationPostUsecase {
  final PostRepo postRepo;

  const EditDonationPostUsecase({required this.postRepo});

  Future<Either<Failure, void>> call(EditDonationPostParams params) {
    return postRepo.editDonationPost(
      id: params.id,
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
