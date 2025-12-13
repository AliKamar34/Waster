import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/models/post_model.dart';
import 'package:waster/features/post/domain/usecases/add_book_mark_use_case.dart';
import 'package:waster/features/post/domain/usecases/delete_book_mark_use_case.dart';
import 'package:waster/features/post/domain/usecases/get_all_book_mark_use_case.dart';

part 'book_mark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  final AddBookMarkUseCase addBookMarkUseCase;
  final DeleteBookMarkUseCase deleteBookMarkUseCase;
  final GetAllBookMarkUseCase getAllBookMarkUseCase;

  BookmarkCubit({
    required this.addBookMarkUseCase,
    required this.deleteBookMarkUseCase,
    required this.getAllBookMarkUseCase,
  }) : super(const BookmarkInitial());

  final Set<String> _bookmarkedPostIds = {};

  final _bookmarkStreamController =
      StreamController<BookmarkChangeEvent>.broadcast();

  Stream<BookmarkChangeEvent> get bookmarkChanges =>
      _bookmarkStreamController.stream;

  @override
  Future<void> close() {
    _bookmarkStreamController.close();
    return super.close();
  }

  Future<void> toggleBookmark(String postId, bool isCurrentlyBookmarked) async {
    emit(BookmarkToggling(postId));

    final result = isCurrentlyBookmarked
        ? await deleteBookMarkUseCase(DeleteBookMarkParams(id: postId))
        : await addBookMarkUseCase(AddBookMarkParams(id: postId));

    result.fold((failure) => emit(BookmarkError(failure.message)), (_) {
      final newState = !isCurrentlyBookmarked;
      if (newState) {
        _bookmarkedPostIds.add(postId);
      } else {
        _bookmarkedPostIds.remove(postId);
      }
      _bookmarkStreamController.add(
        BookmarkChangeEvent(postId: postId, isBookmarked: newState),
      );

      emit(BookmarkToggled(postId, newState));
    });
  }

  Future<void> loadBookmarks({int pageSize = 10}) async {
    emit(const BookmarkLoading());

    final result = await getAllBookMarkUseCase(
      GetAllBookMarkParams(pageNum: 1, pageSize: pageSize),
    );

    result.fold((failure) => emit(BookmarkError(failure.message)), (
      paginatedResponse,
    ) {
      _bookmarkedPostIds.clear();
      _bookmarkedPostIds.addAll(paginatedResponse.items.map((post) => post.id));

      if (paginatedResponse.items.isEmpty) {
        emit(const BookmarkEmpty());
      } else {
        emit(
          BookmarkLoaded(
            posts: paginatedResponse.items,
            hasMore: paginatedResponse.hasNext,
            currentPage: paginatedResponse.pageNumber,
            totalPages: paginatedResponse.totalPages,
          ),
        );
      }
    });
  }

  Future<void> loadMoreBookmarks({int pageSize = 10}) async {
    if (state is! BookmarkLoaded) return;

    final currentState = state as BookmarkLoaded;
    if (!currentState.hasMore) return;

    emit(BookmarkLoadingMore(currentState.posts));

    final result = await getAllBookMarkUseCase(
      GetAllBookMarkParams(
        pageNum: currentState.currentPage + 1,
        pageSize: pageSize,
      ),
    );

    result.fold((failure) => emit(currentState), (paginatedResponse) {
      final updatedPosts = [...currentState.posts, ...paginatedResponse.items];

      _bookmarkedPostIds.addAll(paginatedResponse.items.map((post) => post.id));

      emit(
        BookmarkLoaded(
          posts: updatedPosts,
          hasMore: paginatedResponse.hasNext,
          currentPage: paginatedResponse.pageNumber,
          totalPages: paginatedResponse.totalPages,
        ),
      );
    });
  }

  bool isBookmarked(String postId) {
    return _bookmarkedPostIds.contains(postId);
  }

  Future<void> refreshBookmarks() => loadBookmarks();
}

class BookmarkChangeEvent {
  final String postId;
  final bool isBookmarked;

  BookmarkChangeEvent({required this.postId, required this.isBookmarked});
}
