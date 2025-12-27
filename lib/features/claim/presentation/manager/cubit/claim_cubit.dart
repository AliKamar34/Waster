import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/features/claim/domain/entity/claim_entity.dart';
import 'package:waster/features/claim/domain/entity/claim_response_entity.dart';
import 'package:waster/features/claim/domain/usecase/aprove_claim_use_case.dart';
import 'package:waster/features/claim/domain/usecase/cancle_claim_use_case.dart';
import 'package:waster/features/claim/domain/usecase/claim_post_use_case.dart';
import 'package:waster/features/claim/domain/usecase/get_post_claims_use_case.dart';
import 'package:waster/features/claim/domain/usecase/get_user_claims_use_case.dart';
import 'package:waster/features/claim/domain/usecase/reject_claim_use_case.dart';

part 'claim_state.dart';

class ClaimCubit extends Cubit<ClaimState> {
  ClaimCubit({
    required this.claimPostUseCase,
    required this.getPostClaimsUseCase,
    required this.getUserClaimsUseCase,
    required this.approveClaimUseCase,
    required this.rejectClaimUseCase,
    required this.cancelClaimUseCase,
  }) : super(const ClaimInitial());
  final ClaimPostUseCase claimPostUseCase;
  final GetPostClaimsUseCase getPostClaimsUseCase;
  final GetUserClaimsUseCase getUserClaimsUseCase;
  final ApproveClaimUseCase approveClaimUseCase;
  final RejectClaimUseCase rejectClaimUseCase;
  final CancelClaimUseCase cancelClaimUseCase;

  Future<void> claimPost(String postId) async {
    emit(const ClaimPostLoading());
    final result = await claimPostUseCase.call(ClaimPostParams(postId: postId));
    result.fold(
      (failure) => emit(ClaimFailure(failure.message)),
      (claimResponse) => emit(ClaimPostSuccess(claimResponse)),
    );
  }

  Future<void> getPostClaims(String postId) async {
    emit(const GetPostClaimsLoading());
    final result = await getPostClaimsUseCase.call(
      GetPostClaimsParams(postId: postId),
    );
    result.fold(
      (failure) {
        if (failure.message == 'this post has no claims') {
          emit(const PostClaimsEmpty());
          return;
        }
        emit(ClaimFailure(failure.message));
      },
      (postClaimsList) {
        if (postClaimsList.isEmpty) {
          emit(const PostClaimsEmpty());
          return;
        }
        emit(GetPostClaimsSuccess(postClaimsList));
      },
    );
  }

  Future<void> getUserClaims(String status) async {
    emit(const GetUserClaimsLoading());
    final result = await getUserClaimsUseCase.call(
      GetUserClaimsParams(status: status),
    );
    result.fold(
      (failure) {
        if (failure.message == 'this User has no claims') {
          emit(const UserClaimsEmpty());
        }
        emit(ClaimFailure(failure.message));
      },
      (userClaimsList) {
        if (userClaimsList.isEmpty) {
          emit(const UserClaimsEmpty());
          return;
        }
        emit(GetUserClaimsSuccess(userClaimsList));
      },
    );
  }

  Future<void> approveClaim(String claimId) async {
    emit(ClaimActionLoading(claimId));
    final result = await approveClaimUseCase.call(
      ApproveClaimParams(claimId: claimId),
    );
    result.fold(
      (failure) =>
          emit(ClaimActionFailure(claimId: claimId, message: failure.message)),
      (claimResponse) =>
          emit(ClaimActionSuccess(claimId: claimId, message: 'Approved')),
    );
  }

  Future<void> rejectClaim(String claimId) async {
    emit(ClaimActionLoading(claimId));
    final result = await rejectClaimUseCase.call(
      RejectClaimParams(claimId: claimId),
    );
    result.fold(
      (failure) =>
          emit(ClaimActionFailure(claimId: claimId, message: failure.message)),
      (claimResponse) =>
          emit(ClaimActionSuccess(claimId: claimId, message: 'Rejected')),
    );
  }

  Future<void> cancleClaim(String claimId) async {
    emit(ClaimActionLoading(claimId));
    final result = await cancelClaimUseCase.call(
      CancelClaimParams(claimId: claimId),
    );
    result.fold(
      (failure) =>
          emit(ClaimActionFailure(claimId: claimId, message: failure.message)),
      (claimResponse) =>
          emit(ClaimActionSuccess(claimId: claimId, message: 'Canceled')),
    );
  }
}
