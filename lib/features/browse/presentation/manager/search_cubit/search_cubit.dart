import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/browse/domain/usecase/serach_post_use_case.dart';
import 'package:waster/features/post/presentation/manager/book_mark_cubit/book_mark_cubit.dart';

part 'search_state.dart';

class SearchPostsCubit extends Cubit<SearchPostsState> {
  final SerachPostUseCase searchPostUseCase;
  final BookmarkCubit bookmarkCubit;

  StreamSubscription<BookmarkChangeEvent>? _bookmarkSubscription;

  SearchPostsCubit({
    required this.searchPostUseCase,
    required this.bookmarkCubit,
  }) : super(const SearchPostsInitial()) {
    _listenToBookmarkChanges();
  }

  String _currentQuery = '';
  String _currentCategory = '';
  final int _pageSize = 10;

  void _listenToBookmarkChanges() {
    _bookmarkSubscription = bookmarkCubit.bookmarkChanges.listen((event) {
      final currentState = state;

      if (currentState is SearchPostsLoaded) {
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
          SearchPostsLoaded(
            posts: updatedPosts,
            hasMore: currentState.hasMore,
            currentPage: currentState.currentPage,
            totalPages: currentState.totalPages,
            query: _currentQuery,
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

  Future<void> searchPosts({String? query, String? category}) async {
    if (query != null) _currentQuery = query.trim();
    if (category != null) _currentCategory = category;

    if (_currentQuery.isEmpty) {
      emit(const SearchPostsInitial());
      return;
    }

    emit(const SearchPostsLoading());

    final result = await searchPostUseCase.call(
      SerachPostParams(
        query: _currentQuery,
        category: _currentCategory,
        pageNum: 1,
        pageSize: _pageSize,
      ),
    );

    result.fold((failure) => emit(SearchPostsError(failure.message)), (
      paginatedResponse,
    ) {
      if (paginatedResponse.items.isEmpty) {
        emit(const SearchPostsEmpty());
      } else {
        emit(
          SearchPostsLoaded(
            posts: paginatedResponse.items,
            hasMore: paginatedResponse.hasNext,
            currentPage: paginatedResponse.pageNumber,
            totalPages: paginatedResponse.totalPages,
            query: _currentQuery,
          ),
        );
      }
    });
  }

  Future<void> loadMoreSearchResults() async {
    if (state is! SearchPostsLoaded) return;

    final currentState = state as SearchPostsLoaded;
    if (!currentState.hasMore) return;

    emit(SearchPostsLoadingMore(currentState.posts));

    final result = await searchPostUseCase.call(
      SerachPostParams(
        query: _currentQuery,
        category: _currentCategory,
        pageNum: currentState.currentPage + 1,
        pageSize: _pageSize,
      ),
    );

    result.fold((failure) => emit(currentState), (paginatedResponse) {
      final updatedPosts = [...currentState.posts, ...paginatedResponse.items];

      emit(
        SearchPostsLoaded(
          posts: updatedPosts,
          hasMore: paginatedResponse.hasNext,
          currentPage: paginatedResponse.pageNumber,
          totalPages: paginatedResponse.totalPages,
          query: _currentQuery,
        ),
      );
    });
  }

  void clearSearch() {
    _currentQuery = '';
    _currentCategory = '';
    emit(const SearchPostsInitial());
  }

  Future<void> changeCategoryInSearch(String category) async {
    await searchPosts(category: category);
  }

  String get currentQuery => _currentQuery;
  String get currentCategory => _currentCategory;
  bool get isSearching => state is! SearchPostsInitial;
}
