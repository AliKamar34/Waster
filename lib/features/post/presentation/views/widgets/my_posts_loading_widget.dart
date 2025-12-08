import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/features/post/presentation/views/widgets/my_post_pop_up_menu_button.dart';
import 'package:waster/features/post/presentation/views/widgets/post_details_container.dart';

class MyPostsLoadingWidget extends StatelessWidget {
  const MyPostsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fakePostEntity = PostEntity(
      id: 'id',
      title: ' title',
      description: 'description',
      status: 'avalible',
      quantity: 'quantity',
      unit: 'Unit 2',
      type: 'type',
      category: 'category 1',
      pickupLocation: 'pickupLocation',
      expiresOn: DateTime.now(),
      created: DateTime.now(),
      imageUrl: 'imageUrl',
      hasImage: true,
      isBookmarked: false,
      hoursUntilExpiry: null,
      owner: null,
    );
    return Skeletonizer(
      child: ListView(
        children: List.generate(
          3,
          (index) => PostDetailsContainer(
            postAction: MyPostPopUpMenuButton(postEntity: fakePostEntity),
            postEntity: fakePostEntity,
          ),
        ),
      ),
    );
  }
}
