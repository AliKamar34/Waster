import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_home_categories_bloc_builder.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_home_post_button.dart';
import 'package:waster/features/home/presentation/views/widgets/feed_posts_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  bool _showPostButton = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 100 && _showPostButton) {
      setState(() => _showPostButton = false);
    } else if (_scrollController.offset <= 100 && !_showPostButton) {
      setState(() => _showPostButton = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        spacing: 10,
        children: [
          const CustomHomeAppBar(),
          CustomHomePostButton(showPostButton: _showPostButton),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _showPostButton
                ? const CustomHomeCategoriesBlocBuilder()
                : const SizedBox.shrink(key: ValueKey('empty')),
          ),
          Expanded(
            child: FeedPostsListView(scrollController: _scrollController),
          ),
        ],
      ),
    );
  }
}
