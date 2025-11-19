import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_stats_row.dart';
import 'package:waster/features/browse/presentation/views/widgets/order_tags_list_view.dart';
import 'package:waster/features/browse/presentation/views/widgets/oreder_name_and_details_widget.dart';
import 'package:waster/features/post/domain/entity/enums/post_mode_enum.dart';

class MyPostsView extends StatelessWidget {
  const MyPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const CustomAppBar(title: 'My Posts'),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 16.h),
                    child: const MyPostDetailsContainer(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPostDetailsContainer extends StatelessWidget {
  const MyPostDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes.orderDetailsView);
      },
      child: CustomContainer(
        child: Column(
          spacing: 24,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                height: 200.h,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl:
                    'http://waster.runasp.net//uploads/images/d3dec7c3-17d2-4775-9bf1-4bd6a2da0da5.jpg',
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error);
                },
              ),
            ),
            OrederNameAndDetailsWidget(
              postAction: PopupMenuButton<String>(
                icon: const Icon(Icons.more_horiz),
                onSelected: (value) {
                  log(value);
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                      context.pushNamed(
                        AppRoutes.donateView,
                        extra: {'postMode': PostMode.create, 'post': null},
                      );
                    },
                    value: '1',
                    child: const Text('Edit'),
                  ),
                  const PopupMenuItem(value: '2', child: Text('Delete')),
                ],
              ),
            ),
            const OrderStatsRow(),
            const OrderTagsListView(),
          ],
        ),
      ),
    );
  }
}
