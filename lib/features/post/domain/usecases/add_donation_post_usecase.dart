import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/post/domain/repo/post_repo.dart';
import 'package:waster/features/post/domain/usecases/process_image_usecase.dart';

class AddDonationPostParams extends Equatable {
  final String title;
  final String description;
  final String quantity;
  final String unit;
  final String pickupLocation;
  final DateTime expiresOn;
  final String category;
  final File imageFile;

  const AddDonationPostParams({
    required this.title,
    required this.description,
    required this.quantity,
    required this.unit,
    required this.pickupLocation,
    required this.expiresOn,
    required this.category,
    required this.imageFile,
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
    imageFile,
  ];
}

class AddDonationPostUsecase {
  final PostRepo postRepo;
  final ProcessImageUseCase processImageUseCase;

  const AddDonationPostUsecase({
    required this.postRepo,
    required this.processImageUseCase,
  });

  Future<Either<Failure, void>> call(AddDonationPostParams params) async {
    final imageResult = await processImageUseCase(params.imageFile);

    return imageResult.fold((failure) => Left(failure), (processedImage) async {
      return postRepo.addDonationPost(
        title: params.title,
        description: params.description,
        quantity: params.quantity,
        unit: params.unit,
        pickupLocation: params.pickupLocation,
        expiresOn: params.expiresOn,
        category: params.category,
        imageType: processedImage.mimeType,
        imageData: processedImage.base64Data,
      );
    });
  }
}
