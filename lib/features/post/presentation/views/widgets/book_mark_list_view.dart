import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/widgets/custom_empty_widget.dart';
import 'package:waster/features/home/presentation/views/widgets/save_post_action.dart';
import 'package:waster/features/post/presentation/manager/book_mark_cubit/book_mark_cubit.dart';
import 'package:waster/features/post/presentation/views/widgets/post_details_container.dart';
import 'package:waster/features/post/presentation/views/widgets/my_posts_loading_widget.dart';

class BookMarkListView extends StatefulWidget {
  const BookMarkListView({super.key});

  @override
  State<BookMarkListView> createState() => _BookMarkListViewState();
}

class _BookMarkListViewState extends State<BookMarkListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    context.read<BookmarkCubit>().refreshBookmarks();

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
      context.read<BookmarkCubit>().loadMoreBookmarks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookmarkCubit, BookmarkState>(
      listener: (context, state) {
        if (state is BookmarkToggled && !state.isNowBookmarked) {
          context.read<BookmarkCubit>().refreshBookmarks();
        }
      },
      builder: (context, state) {
        if (state is BookmarkLoaded || state is BookmarkLoadingMore) {
          final posts = state is BookmarkLoaded
              ? state.posts
              : (state as BookmarkLoadingMore).currentPosts;

          final isLoadingMore = state is BookmarkLoadingMore;
          final hasMore = state is BookmarkLoaded ? state.hasMore : true;
          return RefreshIndicator(
            onRefresh: () => context.read<BookmarkCubit>().refreshBookmarks(),

            child: ListView.builder(
              controller: _scrollController,
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
                      postId: posts[index].id,
                      initialIsBookmarked: true,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is BookmarkLoading) {
          return const MyPostsLoadingWidget();
        } else if (state is BookmarkEmpty) {
          return CustomEmptyWidget(message: LocaleKeys.No_Posts_found.tr());
        } else if (state is BookmarkError) {
          return const Center(child: Text('Something went wrong'));
        } else {
          BlocProvider.of<BookmarkCubit>(context).loadBookmarks();
          return const MyPostsLoadingWidget();
        }
      },
    );
  }
}
