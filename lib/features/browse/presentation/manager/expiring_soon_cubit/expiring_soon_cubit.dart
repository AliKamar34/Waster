import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/browse/domain/usecase/expiring_soon_posts_use_case.dart';

part 'expiring_soon_state.dart';

class ExpiringSoonCubit extends Cubit<ExpiringSoonState> {
  final ExpiringSoonPostsUseCase expiringSoonPostsUseCase;

  ExpiringSoonCubit({required this.expiringSoonPostsUseCase})
    : super(const ExpiringSoonInitial());

  Future<void> loadExpiringSoonPosts({
    int hours = 24,
    int pageSize = 10,
  }) async {
    emit(const ExpiringSoonLoading());

    final result = await expiringSoonPostsUseCase.call(
      ExpiringSoonPostsParams(hours: hours, pageNum: 1, pageSize: pageSize),
    );

    result.fold((failure) => emit(ExpiringSoonError(failure.message)), (
      paginatedResponse,
    ) {
      if (paginatedResponse.items.isEmpty) {
        emit(const ExpiringSoonEmpty());
        return;
      }
      emit(
        ExpiringSoonLoaded(
          posts: paginatedResponse.items,
          hasMore: paginatedResponse.hasNext,
          currentPage: paginatedResponse.pageNumber,
          totalPages: paginatedResponse.totalPages,
        ),
      );
    });
  }

  Future<void> loadMoreExpiresSoonPosts({
    int hours = 24,
    int pageSize = 10,
  }) async {
    if (state is! ExpiringSoonLoaded) return;

    final currentState = state as ExpiringSoonLoaded;

    if (!currentState.hasMore) return;

    emit(ExpiringSoonLoadingMore(currentState.posts));

    final result = await expiringSoonPostsUseCase.call(
      ExpiringSoonPostsParams(
        pageNum: currentState.currentPage + 1,
        pageSize: pageSize,
        hours: hours,
      ),
    );

    result.fold(
      (failure) {
        emit(currentState);
      },
      (paginatedResponse) {
        final updatedPosts = [
          ...currentState.posts,
          ...paginatedResponse.items,
        ];

        emit(
          ExpiringSoonLoaded(
            posts: updatedPosts,
            hasMore: paginatedResponse.hasNext,
            currentPage: paginatedResponse.pageNumber,
            totalPages: paginatedResponse.totalPages,
          ),
        );
      },
    );
  }
}
