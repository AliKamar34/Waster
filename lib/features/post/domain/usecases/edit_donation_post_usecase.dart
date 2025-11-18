import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/post/domain/repo/post_repo.dart';
import 'package:waster/features/post/domain/usecases/process_image_usecase.dart';

class EditDonationPostParams extends Equatable {
  final String id;
  final String title;
  final String description;
  final String quantity;
  final String unit;
  final String pickupLocation;
  final DateTime expiresOn;
  final String category;
  final File imageFile;

  const EditDonationPostParams({
    required this.id,
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
    id,
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

class EditDonationPostUsecase {
  final PostRepo postRepo;
  final ProcessImageUseCase processImageUseCase;

  const EditDonationPostUsecase({
    required this.postRepo,
    required this.processImageUseCase,
  });

  Future<Either<Failure, void>> call(EditDonationPostParams params) async {
    final imageResult = await processImageUseCase(params.imageFile);

    return imageResult.fold((failure) => Left(failure), (processedImage) async {
      return postRepo.editDonationPost(
        id: params.id,
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
