import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/auth/domain/entity/auth_entity.dart';
import 'package:waster/features/auth/domain/repo/auth_repo.dart';

class GoogleSignInParams extends Equatable {
  final String idToken;

  const GoogleSignInParams({required this.idToken});

  @override
  List<Object?> get props => [idToken];
}

class GoogleSignInUseCase {
  final AuthRepo authRepo;

  GoogleSignInUseCase({required this.authRepo});

  Future<Either<Failure, AuthEntity>> call(GoogleSignInParams params) {
    return authRepo.googleSignIn(idToken: params.idToken);
  }
}
