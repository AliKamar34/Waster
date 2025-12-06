import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/widgets/custom_empty_widget.dart';
import 'package:waster/features/home/presentation/manager/feed_cubit/feed_cubit.dart';
import 'package:waster/features/post/presentation/views/widgets/my_post_details_container.dart';
import 'package:waster/features/post/presentation/views/widgets/my_posts_loading_widget.dart';

class FeedPostsListView extends StatefulWidget {
  const FeedPostsListView({super.key});

  @override
  State<FeedPostsListView> createState() => _FeedPostsListViewState();
}

class _FeedPostsListViewState extends State<FeedPostsListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    context.read<FeedPostsCubit>().loadPosts();

    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
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
              controller: _scrollController,
              itemCount: posts.length + (isLoadingMore || hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == posts.length) {
                  return const MyPostsLoadingWidget();
                }
                return Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 16.h),
                  child: MyPostDetailsContainer(postEntity: posts[index]),
                );
              },
            ),
          );
        } else if (state is FeedPostsLoading) {
          return const MyPostsLoadingWidget();
        } else if (state is FeedPostsEmpty) {
          return CustomEmptyWidget(
            message: LocaleKeys.No_expiring_soon_posts_found.tr(),
          );
        } else if (state is FeedPostsError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
