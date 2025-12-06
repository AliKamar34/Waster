part of 'feed_cubit.dart';

sealed class FeedPostsState extends Equatable {
  const FeedPostsState();

  @override
  List<Object> get props => [];
}

final class FeedPostsInitial extends FeedPostsState {
  const FeedPostsInitial();
}

final class FeedPostsLoading extends FeedPostsState {
  const FeedPostsLoading();
}

final class FeedPostsLoaded extends FeedPostsState {
  final List<PostModel> posts;
  final bool hasMore;
  final int currentPage;
  final int totalPages;

  const FeedPostsLoaded({
    required this.posts,
    required this.hasMore,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  List<Object> get props => [posts, hasMore, currentPage, totalPages];
}

final class FeedPostsLoadingMore extends FeedPostsState {
  final List<PostModel> currentPosts;

  const FeedPostsLoadingMore(this.currentPosts);

  @override
  List<Object> get props => [currentPosts];
}

final class FeedPostsError extends FeedPostsState {
  final String message;

  const FeedPostsError(this.message);

  @override
  List<Object> get props => [message];
}

final class FeedPostsEmpty extends FeedPostsState {
  const FeedPostsEmpty();
}
