import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/features/home/domain/usecases/add_donation_post_usecase.dart';
import 'package:waster/features/home/domain/usecases/edit_donation_post_usecase.dart';
import 'package:waster/features/home/domain/usecases/process_image_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final AddDonationPostUsecase addDonationPostUsecase;
  final EditDonationPostUsecase editDonationPostUsecase;
  final ProcessImageUseCase processImageUseCase;

  PostBloc({
    required this.addDonationPostUsecase,
    required this.editDonationPostUsecase,
    required this.processImageUseCase,
  }) : super(const PostInitial()) {
    on<CreatePostEvent>(_postCreateEvent);
    on<EditPostEvent>(_editPostEvent);
  }

  Future<void> _postCreateEvent(
    CreatePostEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(const PostLoading());
    final imageResult = await processImageUseCase(event.imageFile);

    final ProcessedImage? processedImage = imageResult.fold((failure) {
      emit(PostFailure(message: failure.message));
      return null;
    }, (image) => image);

    if (processedImage == null) return;

    final result = await addDonationPostUsecase.call(
      AddDonationPostParams(
        title: event.title,
        description: event.description,
        quantity: event.quantity,
        unit: event.unit,
        pickupLocation: event.pickupLocation,
        expiresOn: event.expiresOn,
        category: event.category,
        imageType: processedImage.mimeType,
        imageData: processedImage.base64Data,
      ),
    );
    result.fold(
      (failure) {
        emit(PostFailure(message: failure.message));
      },
      (_) {
        emit(const PostSuccess());
      },
    );
  }

  Future<void> _editPostEvent(
    EditPostEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(const PostLoading());
    final imageResult = await processImageUseCase(event.imageFile);

    final ProcessedImage? processedImage = imageResult.fold((failure) {
      emit(PostFailure(message: failure.message));
      return null;
    }, (image) => image);

    if (processedImage == null) return;

    final result = await editDonationPostUsecase.call(
      EditDonationPostParams(
        id: event.id,
        title: event.title,
        description: event.description,
        quantity: event.quantity,
        unit: event.unit,
        pickupLocation: event.pickupLocation,
        expiresOn: event.expiresOn,
        category: event.category,
        imageType: processedImage.mimeType, // ✅ من الـ Use Case
        imageData: processedImage.base64Data, // ✅ من الـ Use Case
      ),
    );
    result.fold(
      (failure) {
        emit(PostFailure(message: failure.message));
      },
      (_) {
        emit(const PostSuccess());
      },
    );
  }
}
