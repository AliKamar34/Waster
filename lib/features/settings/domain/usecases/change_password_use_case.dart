import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';

class ChangePasswordParams extends Equatable {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  const ChangePasswordParams({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [currentPassword, newPassword, confirmPassword];
}

class ChangePasswordUseCase {
  final SettingsRepo settingsRepo;

  const ChangePasswordUseCase({required this.settingsRepo});
  Future<Either<Failure, void>> call(ChangePasswordParams params) {
    return settingsRepo.changePassword(
      currentPassword: params.currentPassword,
      newPassword: params.newPassword,
      confirmPassword: params.confirmPassword,
    );
  }
}
