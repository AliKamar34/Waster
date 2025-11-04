import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/core/usecases/use_cases.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';

class GetUserDetailsUseCase {
  final SettingsRepo settingsRepo;

  const GetUserDetailsUseCase({required this.settingsRepo});

  Future<Either<Failure, UserEntity>> call(NoParams params) {
    return settingsRepo.getUserDetails();
  }
}
