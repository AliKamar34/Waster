import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';

class DeleteAccountParams {
  final String password;

  DeleteAccountParams({required this.password});
}

class DeleteAccountUseCase {
  final SettingsRepo settingsRepo;

  const DeleteAccountUseCase({required this.settingsRepo});

  Future<Either<Failure, void>> call(DeleteAccountParams params) {
    return settingsRepo.deleteAccount(password: params.password);
  }
}
