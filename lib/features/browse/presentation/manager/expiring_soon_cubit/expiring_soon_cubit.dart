import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/browse/domain/usecase/expiring_soon_posts_use_case.dart';
import 'package:waster/features/post/presentation/manager/book_mark_cubit/book_mark_cubit.dart';

part 'expiring_soon_state.dart';

class ExpiringSoonCubit extends Cubit<ExpiringSoonState> {
  final ExpiringSoonPostsUseCase expiringSoonPostsUseCase;
  final BookmarkCubit bookmarkCubit;

  StreamSubscription<BookmarkChangeEvent>? _bookmarkSubscription;

  ExpiringSoonCubit({
    required this.expiringSoonPostsUseCase,
    required this.bookmarkCubit,
  }) : super(const ExpiringSoonInitial()) {
    _listenToBookmarkChanges();
  }

  void _listenToBookmarkChanges() {
    _bookmarkSubscription = bookmarkCubit.bookmarkChanges.listen((event) {
      final currentState = state;

      if (currentState is ExpiringSoonLoaded) {
        final updatedPosts = currentState.posts.map((post) {
          if (post.id == event.postId) {
            return PostModel(
              id: post.id,
              title: post.title,
              description: post.description,
              quantity: post.quantity,
              unit: post.unit,
              type: post.type,
              category: post.category,
              pickupLocation: post.pickupLocation,
              expiresOn: post.expiresOn,
              created: post.created,
              imageUrl: post.imageUrl,
              hasImage: post.hasImage,
              isBookmarked: event.isBookmarked,
              hoursUntilExpiry: post.hoursUntilExpiry,
              owner: post.owner,
              status: post.status,
            );
          }
          return post;
        }).toList();

        emit(
          ExpiringSoonLoaded(
            posts: updatedPosts,
            hasMore: currentState.hasMore,
            currentPage: currentState.currentPage,
            totalPages: currentState.totalPages,
          ),
        );
      }
    });
  }

  @override
  Future<void> close() {
    _bookmarkSubscription?.cancel();
    return super.close();
  }

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
