import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/post/domain/usecases/get_all_user_posts_usecase.dart';

part 'get_all_user_posts_state.dart';

class GetAllUserPostsCubit extends Cubit<GetAllUserPostsState> {
  GetAllUserPostsCubit({required this.getAllUsersPostsUseCase})
    : super(const GetAllUserPostsInitial());
  final GetAllUsersPostsUseCase getAllUsersPostsUseCase;

  Future<void> loadPosts({int pageSize = 10}) async {
    emit(const GetAllUserPostsListLoading());

    final result = await getAllUsersPostsUseCase(
      GetAllUsersPostsParams(pageNum: 1, pageSize: pageSize),
    );

    result.fold(
      (failure) => emit(GetAllUserPostsListFailure(failure.message)),
      (paginatedResponse) {
        emit(
          GetAllUserPostsListLoaded(
            posts: paginatedResponse.items,
            hasMore: paginatedResponse.hasNext,
            currentPage: paginatedResponse.pageNumber,
            totalPages: paginatedResponse.totalPages,
          ),
        );
      },
    );
  }

  Future<void> loadMorePosts({int pageSize = 10}) async {
    if (state is! GetAllUserPostsListLoaded) return;
    final currentState = state as GetAllUserPostsListLoaded;
    if (!currentState.hasMore) return;

    emit(GetAllUserPostsListLoadingMore(currentState.posts));

    final result = await getAllUsersPostsUseCase(
      GetAllUsersPostsParams(
        pageNum: currentState.currentPage + 1,
        pageSize: pageSize,
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
          GetAllUserPostsListLoaded(
            posts: updatedPosts,
            hasMore: paginatedResponse.hasNext,
            currentPage: paginatedResponse.pageNumber,
            totalPages: paginatedResponse.totalPages,
          ),
        );
      },
    );
  }

  Future<void> refreshPosts({int pageSize = 10}) async {
    await loadPosts(pageSize: pageSize);
  }
}
