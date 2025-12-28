import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:waster/features/claim/domain/entity/claim_entity.dart';
import 'package:waster/features/claim/domain/entity/claim_post_entity.dart';
import 'package:waster/features/claim/domain/entity/claim_user_entity.dart';
import 'package:waster/features/claim/presentation/views/widgets/claimed_post_container.dart';

class CustomUserClaimsLoadingWidget extends StatelessWidget {
  const CustomUserClaimsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ClaimedPostContainer(
                claimEntity: ClaimEntity(
                  id: '',
                  postId: '',
                  status: '',
                  claimedAt: DateTime.now(),
                  post: ClaimPostEntity(
                    id: 'id',
                    title: 'title',
                    description: '',
                    location: 'location',
                    status: 'status',
                    expiryDate: DateTime.now(),
                  ),
                  postOwner: ClaimUserEntity(
                    fullName: 'fullName',
                    email: 'email',
                    phoneNumber: 'phoneNumber',
                    address: 'address',
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
