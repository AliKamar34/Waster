part of 'book_mark_cubit.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkInitial extends BookmarkState {
  const BookmarkInitial();
}

class BookmarkLoading extends BookmarkState {
  const BookmarkLoading();
}

class BookmarkToggling extends BookmarkState {
  final String postId;

  const BookmarkToggling(this.postId);

  @override
  List<Object> get props => [postId];
}

class BookmarkToggled extends BookmarkState {
  final String postId;
  final bool isNowBookmarked;

  const BookmarkToggled(this.postId, this.isNowBookmarked);

  @override
  List<Object> get props => [postId, isNowBookmarked];
}

class BookmarkLoaded extends BookmarkState {
  final List<PostModel> posts;
  final bool hasMore;
  final int currentPage;
  final int totalPages;

  const BookmarkLoaded({
    required this.posts,
    required this.hasMore,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  List<Object> get props => [posts, hasMore, currentPage, totalPages];
}

class BookmarkLoadingMore extends BookmarkState {
  final List<PostModel> currentPosts;

  const BookmarkLoadingMore(this.currentPosts);

  @override
  List<Object> get props => [currentPosts];
}

class BookmarkEmpty extends BookmarkState {
  const BookmarkEmpty();
}

class BookmarkError extends BookmarkState {
  final String message;

  const BookmarkError(this.message);

  @override
  List<Object> get props => [message];
}
