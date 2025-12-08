import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/widgets/custom_empty_widget.dart';
import 'package:waster/features/home/presentation/manager/feed_cubit/feed_cubit.dart';
import 'package:waster/features/home/presentation/views/widgets/save_post_action.dart';
import 'package:waster/features/post/presentation/views/widgets/post_details_container.dart';
import 'package:waster/features/post/presentation/views/widgets/my_posts_loading_widget.dart';

class FeedPostsListView extends StatefulWidget {
  const FeedPostsListView({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<FeedPostsListView> createState() => _FeedPostsListViewState();
}

class _FeedPostsListViewState extends State<FeedPostsListView> {
  @override
  void initState() {
    super.initState();
    context.read<FeedPostsCubit>().loadPosts();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.scrollController.position.pixels >=
        widget.scrollController.position.maxScrollExtent * 0.9) {
      context.read<FeedPostsCubit>().loadMorePosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedPostsCubit, FeedPostsState>(
      builder: (context, state) {
        if (state is FeedPostsLoaded || state is FeedPostsLoadingMore) {
          final posts = state is FeedPostsLoaded
              ? state.posts
              : (state as FeedPostsLoadingMore).currentPosts;

          final isLoadingMore = state is FeedPostsLoadingMore;
          final hasMore = state is FeedPostsLoaded ? state.hasMore : true;

          return RefreshIndicator(
            onRefresh: () => context.read<FeedPostsCubit>().loadPosts(),
            child: ListView.builder(
              controller: widget.scrollController,
              itemCount: posts.length + (isLoadingMore || hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == posts.length) {
                  return const MyPostsLoadingWidget();
                }
                return Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 16.h),
                  child: PostDetailsContainer(
                    postEntity: posts[index],
                    postAction: SavePostAction(
                      isBookmarked: posts[index].isBookmarked,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeedPostsLoading) {
          return const MyPostsLoadingWidget();
        } else if (state is FeedPostsEmpty) {
          return CustomEmptyWidget(message: LocaleKeys.No_Posts_found.tr());
        } else if (state is FeedPostsError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
