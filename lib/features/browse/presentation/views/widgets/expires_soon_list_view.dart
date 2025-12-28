import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/core/widgets/custom_empty_widget.dart';
import 'package:waster/features/browse/presentation/manager/expiring_soon_cubit/expiring_soon_cubit.dart';
import 'package:waster/features/home/presentation/views/widgets/save_post_action.dart';
import 'package:waster/features/post/presentation/views/widgets/post_details_container.dart';
import 'package:waster/features/post/presentation/views/widgets/my_posts_loading_widget.dart';

class ExpiresSoonListView extends StatefulWidget {
  const ExpiresSoonListView({super.key});

  @override
  State<ExpiresSoonListView> createState() => _ExpiresSoonListViewState();
}

class _ExpiresSoonListViewState extends State<ExpiresSoonListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    context.read<ExpiringSoonCubit>().loadExpiringSoonPosts();

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
      context.read<ExpiringSoonCubit>().loadMoreExpiresSoonPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpiringSoonCubit, ExpiringSoonState>(
      builder: (context, state) {
        if (state is ExpiringSoonLoaded || state is ExpiringSoonLoadingMore) {
          final posts = state is ExpiringSoonLoaded
              ? state.posts
              : (state as ExpiringSoonLoadingMore).currentPosts;

          final isLoadingMore = state is ExpiringSoonLoadingMore;
          final hasMore = state is ExpiringSoonLoaded ? state.hasMore : true;
          return RefreshIndicator(
            onRefresh: () =>
                context.read<ExpiringSoonCubit>().loadExpiringSoonPosts(),
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 70),
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
                      initialIsBookmarked: posts[index].isBookmarked,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is ExpiringSoonLoading) {
          return const MyPostsLoadingWidget();
        } else if (state is ExpiringSoonEmpty) {
          return CustomEmptyWidget(
            message: LocaleKeys.No_expiring_soon_posts_found.tr(),
            actionWidget: InkWell(
              onTap: () {
                context.pushNamed(AppRoutes.browseAllView);
              },
              child: CustomContainer(
                padding: 6.w,
                backgroundColor: Theme.of(
                  context,
                ).extension<AppColors>()!.scaffoldColor,
                borderWidth: 2,
                child: Text(
                  LocaleKeys.browse_all.tr(),
                  style: AppTextStyle.styleRegular16(context),
                ),
              ),
            ),
          );
        } else if (state is ExpiringSoonError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
