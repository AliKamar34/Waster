import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/widgets/custom_empty_widget.dart';
import 'package:waster/core/widgets/custom_text_field.dart';
import 'package:waster/features/browse/presentation/manager/search_cubit/search_cubit.dart';
import 'package:waster/features/browse/presentation/views/widgets/categories_bloc_builder.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/home/presentation/views/widgets/save_post_action.dart';
import 'package:waster/features/post/presentation/views/widgets/post_details_container.dart';
import 'package:waster/features/post/presentation/views/widgets/my_posts_loading_widget.dart';

class BrowseAllView extends StatefulWidget {
  const BrowseAllView({super.key});

  @override
  State<BrowseAllView> createState() => _BrowseAllViewState();
}

class _BrowseAllViewState extends State<BrowseAllView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          spacing: 16,
          children: [
            CustomAppBar(title: LocaleKeys.Browse_Available_Orders.tr()),
            CustomTextField(
              controller: _searchController,
              prefixIcon: SvgPicture.asset(Assets.browse),
              hint: LocaleKeys.Search_by_food_type_or_donor_name.tr(),
              onChanged: (value) {
                context.read<SearchPostsCubit>().searchPosts(query: value);
              },
            ),
            const CategoriesBlocBuilder(),
            BlocBuilder<SearchPostsCubit, SearchPostsState>(
              builder: (context, state) {
                if (state is SearchPostsLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsetsDirectional.only(bottom: 16.h),
                          child: PostDetailsContainer(
                            postEntity: state.posts[index],
                            postAction: SavePostAction(
                              postId: state.posts[index].id,
                              initialIsBookmarked:
                                  state.posts[index].isBookmarked,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is SearchPostsLoading) {
                  return const Expanded(child: MyPostsLoadingWidget());
                } else if (state is SearchPostsEmpty) {
                  return CustomEmptyWidget(
                    message: LocaleKeys.No_Posts_found.tr(),
                  );
                } else if (state is SearchPostsError) {
                  return Center(child: Text(state.message));
                } else {
                  return CustomEmptyWidget(
                    message: LocaleKeys.Search_by_food_type_or_donor_name.tr(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
