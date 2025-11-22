import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/features/post/domain/usecases/add_donation_post_usecase.dart';
import 'package:waster/features/post/domain/usecases/delete_post_usecase.dart';
import 'package:waster/features/post/domain/usecases/edit_donation_post_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final AddDonationPostUsecase addDonationPostUsecase;
  final EditDonationPostUsecase editDonationPostUsecase;
  final DeletePostUsecase deletePostUsecase;

  PostBloc({
    required this.addDonationPostUsecase,
    required this.editDonationPostUsecase,
    required this.deletePostUsecase,
  }) : super(const PostInitial()) {
    on<CreatePostEvent>(_onCreatePost);
    on<EditPostEvent>(_onEditPost);
    on<DeletePostEvent>(_onDeletePost);
  }
  Future<void> _onCreatePost(
    CreatePostEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(const PostLoading());
    final result = await addDonationPostUsecase.call(
      AddDonationPostParams(
        title: event.title,
        description: event.description,
        quantity: event.quantity,
        unit: event.unit,
        pickupLocation: event.pickupLocation,
        expiresOn: event.expiresOn,
        category: event.category,
        imageFile: event.imageFile,
      ),
    );
    result.fold(
      (failure) => emit(PostFailure(message: failure.message)),
      (_) => emit(const PostSuccess()),
    );
  }

  Future<void> _onEditPost(EditPostEvent event, Emitter<PostState> emit) async {
    emit(const PostLoading());

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
        imageFile: event.imageFile,
      ),
    );
    result.fold(
      (failure) => emit(PostFailure(message: failure.message)),
      (_) => emit(const PostSuccess()),
    );
  }

  Future<void> _onDeletePost(
    DeletePostEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(const PostLoading());
    final result = await deletePostUsecase.call(DeletePostParams(id: event.id));
    result.fold(
      (failure) => emit(PostFailure(message: failure.message)),
      (_) => emit(const PostSuccess()),
    );
  }
}
