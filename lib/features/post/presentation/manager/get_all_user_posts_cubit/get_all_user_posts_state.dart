part of 'get_all_user_posts_cubit.dart';

sealed class GetAllUserPostsState extends Equatable {
  const GetAllUserPostsState();

  @override
  List<Object> get props => [];
}

class GetAllUserPostsInitial extends GetAllUserPostsState {
  const GetAllUserPostsInitial();
}

class GetAllUserPostsListLoading extends GetAllUserPostsState {
  const GetAllUserPostsListLoading();
}

class GetAllUserPostsListEmpty extends GetAllUserPostsState {
  const GetAllUserPostsListEmpty();
}

class GetAllUserPostsListLoadingMore extends GetAllUserPostsState {
  final List<PostModel> currentPosts;

  const GetAllUserPostsListLoadingMore(this.currentPosts);

  @override
  List<Object> get props => [currentPosts];
}

class GetAllUserPostsListLoaded extends GetAllUserPostsState {
  final List<PostModel> posts;
  final bool hasMore;
  final int currentPage;
  final int totalPages;

  const GetAllUserPostsListLoaded({
    required this.posts,
    required this.hasMore,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  List<Object> get props => [posts, hasMore, currentPage, totalPages];

  GetAllUserPostsListLoaded copyWith({
    List<PostModel>? posts,
    bool? hasMore,
    int? currentPage,
    int? totalPages,
  }) {
    return GetAllUserPostsListLoaded(
      posts: posts ?? this.posts,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}

class GetAllUserPostsListFailure extends GetAllUserPostsState {
  final String errMessage;

  const GetAllUserPostsListFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
