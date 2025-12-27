import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/claim/domain/entity/claim_entity.dart';
import 'package:waster/features/claim/presentation/manager/cubit/claim_cubit.dart';
import 'package:waster/features/claim/presentation/views/widgets/approve_and_reject_post_actions.dart';
import 'package:waster/features/claim/presentation/views/widgets/donor_iformation_list_tile.dart';

class CustomClaimsPostWidget extends StatelessWidget {
  const CustomClaimsPostWidget({super.key, required this.claimEntity});
  final ClaimEntity claimEntity;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          DonorIformationListTile(claimUserEntity: claimEntity.recipient!),
          ApproveAndRejectPostActions(
            onApprove: () =>
                context.read<ClaimCubit>().approveClaim(claimEntity.id),
            onReject: () =>
                context.read<ClaimCubit>().rejectClaim(claimEntity.id),
          ),
        ],
      ),
    );
  }
}
