import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/claim/domain/entity/claim_user_entity.dart';
import 'package:waster/features/claim/presentation/views/widgets/donor_iformation_list_tile.dart';

class CustomPostClaimsLoadingWidget extends StatelessWidget {
  const CustomPostClaimsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomContainer(
                child: DonorIformationListTile(
                  claimUserEntity: ClaimUserEntity(
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
