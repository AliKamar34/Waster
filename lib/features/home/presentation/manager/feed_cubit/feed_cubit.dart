import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/home/domain/usecases/feed_posts_use_case.dart';
import 'package:waster/features/post/presentation/manager/book_mark_cubit/book_mark_cubit.dart';

part 'feed_state.dart';

class FeedPostsCubit extends Cubit<FeedPostsState> {
  final FeedPostsUseCase feedPostsUseCase;
  final BookmarkCubit bookmarkCubit;

  StreamSubscription<BookmarkChangeEvent>? _bookmarkSubscription;

  FeedPostsCubit({required this.feedPostsUseCase, required this.bookmarkCubit})
    : super(const FeedPostsInitial()) {
    _listenToBookmarkChanges();
  }

  String _currentCategory = '';
  final int _pageSize = 10;

  void _listenToBookmarkChanges() {
    _bookmarkSubscription = bookmarkCubit.bookmarkChanges.listen((event) {
      final currentState = state;
      if (currentState is FeedPostsLoaded) {
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
          FeedPostsLoaded(
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

  Future<void> loadPosts({String category = '', int pageSize = 10}) async {
    if (state is FeedPostsLoaded && _currentCategory == category) {
      return;
    }

    _currentCategory = category;

    emit(const FeedPostsLoading());

    final result = await feedPostsUseCase.call(
      FeedPostsParams(category: category, pageNum: 1, pageSize: pageSize),
    );

    result.fold((failure) => emit(FeedPostsError(failure.message)), (
      paginatedResponse,
    ) {
      if (paginatedResponse.items.isEmpty) {
        emit(const FeedPostsEmpty());
      } else {
        emit(
          FeedPostsLoaded(
            posts: paginatedResponse.items,
            hasMore: paginatedResponse.hasNext,
            currentPage: paginatedResponse.pageNumber,
            totalPages: paginatedResponse.totalPages,
          ),
        );
      }
    });
  }

  Future<void> loadMorePosts() async {
    if (state is! FeedPostsLoaded) return;

    final currentState = state as FeedPostsLoaded;
    if (!currentState.hasMore) return;

    emit(FeedPostsLoadingMore(currentState.posts));

    final result = await feedPostsUseCase.call(
      FeedPostsParams(
        category: _currentCategory,
        pageNum: currentState.currentPage + 1,
        pageSize: _pageSize,
      ),
    );

    result.fold((failure) => emit(currentState), (paginatedResponse) {
      final updatedPosts = [...currentState.posts, ...paginatedResponse.items];

      emit(
        FeedPostsLoaded(
          posts: updatedPosts,
          hasMore: paginatedResponse.hasNext,
          currentPage: paginatedResponse.pageNumber,
          totalPages: paginatedResponse.totalPages,
        ),
      );
    });
  }

  Future<void> refreshPosts() async {
    await loadPosts(category: _currentCategory, pageSize: _pageSize);
  }

  Future<void> changeCategoryFilter(String category) async {
    _currentCategory = category;
    emit(const FeedPostsLoading());
    await loadPosts(category: category, pageSize: _pageSize);
  }

  String get currentCategory => _currentCategory;
}
