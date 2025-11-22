import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/features/post/presentation/manager/cubit/get_all_user_posts_cubit.dart';
import 'package:waster/features/post/presentation/views/widgets/my_post_details_container.dart';
import 'package:waster/features/post/presentation/views/widgets/my_posts_loading_widget.dart';

class MyPostsListView extends StatefulWidget {
  const MyPostsListView({super.key});

  @override
  State<MyPostsListView> createState() => _MyPostsListViewState();
}

class _MyPostsListViewState extends State<MyPostsListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    context.read<GetAllUserPostsCubit>().loadPosts();

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
      context.read<GetAllUserPostsCubit>().loadMorePosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUserPostsCubit, GetAllUserPostsState>(
      builder: (context, state) {
        if (state is GetAllUserPostsListLoaded ||
            state is GetAllUserPostsListLoadingMore) {
          final posts = state is GetAllUserPostsListLoaded
              ? state.posts
              : (state as GetAllUserPostsListLoadingMore).currentPosts;

          final isLoadingMore = state is GetAllUserPostsListLoadingMore;
          final hasMore = state is GetAllUserPostsListLoaded
              ? state.hasMore
              : true;

          if (posts.isEmpty) {
            return const Center(child: Text('No posts yet'));
          }
          return RefreshIndicator(
            onRefresh: () =>
                context.read<GetAllUserPostsCubit>().refreshPosts(),

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
        } else if (state is GetAllUserPostsListLoading) {
          return const MyPostsLoadingWidget();
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
