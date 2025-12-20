part of 'claim_cubit.dart';

sealed class ClaimState extends Equatable {
  const ClaimState();

  @override
  List<Object> get props => [];
}

final class ClaimInitial extends ClaimState {
  const ClaimInitial();
}

/// Loading state for claiming a post
final class ClaimPostLoading extends ClaimState {
  const ClaimPostLoading();
}

/// Loading state for fetching user's claims
final class GetUserClaimsLoading extends ClaimState {
  const GetUserClaimsLoading();
}

/// Loading state for fetching post claims (for donors)
final class GetPostClaimsLoading extends ClaimState {
  const GetPostClaimsLoading();
}

/// Loading state for action operations (approve/reject/cancel)
final class ClaimActionLoading extends ClaimState {
  final String claimId;

  const ClaimActionLoading(this.claimId);

  @override
  List<Object> get props => [claimId];
}

/// Success state after claiming a post
final class ClaimPostSuccess extends ClaimState {
  final ClaimResponseEntity claimResponse;

  const ClaimPostSuccess(this.claimResponse);

  @override
  List<Object> get props => [claimResponse];
}

/// Success state with user's claims list
final class GetUserClaimsSuccess extends ClaimState {
  final List<ClaimEntity> claims;

  const GetUserClaimsSuccess(this.claims);

  @override
  List<Object> get props => [claims];
}

/// Success state with post claims (for donors)
final class GetPostClaimsSuccess extends ClaimState {
  final List<ClaimEntity> claims;

  const GetPostClaimsSuccess(this.claims);

  @override
  List<Object> get props => [claims];
}

/// Success state after approve/reject/cancel action
final class ClaimActionSuccess extends ClaimState {
  final String message;
  final String claimId;

  const ClaimActionSuccess({required this.message, required this.claimId});

  @override
  List<Object> get props => [message, claimId];
}

/// error state after approve/reject/cancel action fail
final class ClaimActionFailure extends ClaimState {
  final String claimId;
  final String message;

  const ClaimActionFailure({required this.claimId, required this.message});

  @override
  List<Object> get props => [claimId, message];
}

/// Empty state when user has no claims
final class UserClaimsEmpty extends ClaimState {
  const UserClaimsEmpty();
}

/// Empty state when post has no claims
final class PostClaimsEmpty extends ClaimState {
  const PostClaimsEmpty();
}

/// Generic error state with specific error message
final class ClaimFailure extends ClaimState {
  final String message;

  const ClaimFailure(this.message);

  @override
  List<Object> get props => [message];
}
