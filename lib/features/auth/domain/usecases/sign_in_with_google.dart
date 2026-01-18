import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/services/google_auth_service.dart';
import 'package:waster/features/auth/domain/entity/auth_entity.dart';
import 'package:waster/features/auth/domain/repo/auth_repo.dart';

class GoogleSignInParams extends Equatable {
  const GoogleSignInParams();

  @override
  List<Object?> get props => [];
}

class GoogleSignInUseCase {
  final AuthRepo authRepo;
  final GoogleAuthService googleAuthService;

  GoogleSignInUseCase({
    required this.authRepo,
    required this.googleAuthService,
  });

  Future<Either<Failure, AuthEntity>> call(GoogleSignInParams params) async {
    try {
      final String idToken = await googleAuthService.signIn();

      final result = await authRepo.googleSignIn(idToken: idToken);

      return result;
    } on GoogleAuthException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure('Unexpected error during Google sign-in: $e'));
    }
  }
}
