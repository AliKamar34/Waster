import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/post/presentation/views/widgets/my_posts_list_view.dart';

class BookMarkView extends StatelessWidget {
  const BookMarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w),
        child: const Column(
          children: [
            CustomAppBar(title: 'Book Marks'),
            Expanded(child: MyPostsListView()),
          ],
        ),
      ),
    );
  }
}
