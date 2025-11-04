import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';

class ChangeEmailParams extends Equatable {
  final String newEmail;
  final String password;

  const ChangeEmailParams({required this.newEmail, required this.password});

  @override
  List<Object?> get props => [newEmail, password];
}

class ChangeEmailUseCase {
  final SettingsRepo settingsRepo;

  const ChangeEmailUseCase({required this.settingsRepo});
  Future<Either<Failure, void>> call(ChangeEmailParams params) {
    return settingsRepo.changeEmail(
      newEmail: params.newEmail,
      password: params.password,
    );
  }
}
