import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/features/post/presentation/views/widgets/my_post_details_container.dart';

class MyPostsLoadingWidget extends StatelessWidget {
  const MyPostsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<MyPostDetailsContainer> loadingposts = [
      MyPostDetailsContainer(
        postEntity: PostEntity(
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
        ),
      ),
      MyPostDetailsContainer(
        postEntity: PostEntity(
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
        ),
      ),
      MyPostDetailsContainer(
        postEntity: PostEntity(
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
        ),
      ),
    ];
    return Skeletonizer(child: ListView(children: loadingposts));
  }
}
