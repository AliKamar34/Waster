import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/features/home/domain/usecases/add_donation_post_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final AddDonationPostUsecase addDonationPostUsecase;
  PostBloc({required this.addDonationPostUsecase})
    : super(const PostInitial()) {
    on<CreatePostEvent>(_postCreateEvent);
  }

  Future<void> _postCreateEvent(
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
        imageType: event.imageType,
        imageData: event.imageData,
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
