part of 'search_cubit.dart';

sealed class SearchPostsState extends Equatable {
  const SearchPostsState();

  @override
  List<Object> get props => [];
}

final class SearchPostsInitial extends SearchPostsState {
  const SearchPostsInitial();
}

final class SearchPostsLoading extends SearchPostsState {
  const SearchPostsLoading();
}

final class SearchPostsLoaded extends SearchPostsState {
  final List<PostModel> posts;
  final bool hasMore;
  final int currentPage;
  final int totalPages;
  final String query;

  const SearchPostsLoaded({
    required this.posts,
    required this.hasMore,
    required this.currentPage,
    required this.totalPages,
    required this.query,
  });

  @override
  List<Object> get props => [posts, hasMore, currentPage, totalPages, query];
}

final class SearchPostsLoadingMore extends SearchPostsState {
  final List<PostModel> currentPosts;

  const SearchPostsLoadingMore(this.currentPosts);

  @override
  List<Object> get props => [currentPosts];
}

final class SearchPostsEmpty extends SearchPostsState {
  const SearchPostsEmpty();
}

final class SearchPostsError extends SearchPostsState {
  final String message;

  const SearchPostsError(this.message);

  @override
  List<Object> get props => [message];
}
