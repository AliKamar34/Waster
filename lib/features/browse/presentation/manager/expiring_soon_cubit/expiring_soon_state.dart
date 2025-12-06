part of 'expiring_soon_cubit.dart';

sealed class ExpiringSoonState extends Equatable {
  const ExpiringSoonState();

  @override
  List<Object> get props => [];
}

final class ExpiringSoonInitial extends ExpiringSoonState {
  const ExpiringSoonInitial();
}

final class ExpiringSoonLoading extends ExpiringSoonState {
  const ExpiringSoonLoading();
}

final class ExpiringSoonLoaded extends ExpiringSoonState {
  final List<PostModel> posts;
  final bool hasMore;
  final int currentPage;
  final int totalPages;

  const ExpiringSoonLoaded({
    required this.posts,
    required this.hasMore,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  List<Object> get props => [posts, hasMore, currentPage, totalPages];
}

final class ExpiringSoonLoadingMore extends ExpiringSoonState {
  final List<PostModel> currentPosts;

  const ExpiringSoonLoadingMore(this.currentPosts);

  @override
  List<Object> get props => [currentPosts];
}

final class ExpiringSoonError extends ExpiringSoonState {
  final String message;

  const ExpiringSoonError(this.message);

  @override
  List<Object> get props => [message];
}

final class ExpiringSoonEmpty extends ExpiringSoonState {
  const ExpiringSoonEmpty();
}
