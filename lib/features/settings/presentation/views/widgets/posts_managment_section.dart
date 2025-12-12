import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/settings/presentation/views/widgets/posts_managment_button.dart';

class PostsManagmentSection extends StatelessWidget {
  const PostsManagmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Posts Managment', style: AppTextStyle.styleBold16(context)),
          PostsManagmentButton(
            title: 'My Posts',
            onTap: () {
              context.pushNamed(AppRoutes.myPostsView);
            },
          ),
          PostsManagmentButton(
            title: 'Book Marks',
            onTap: () {
              context.pushNamed(AppRoutes.bookMarks);
            },
          ),
        ],
      ),
    );
  }
}
