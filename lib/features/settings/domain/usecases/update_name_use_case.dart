import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';

class UpdateNameParams extends Equatable {
  final String firstName;
  final String lastName;

  const UpdateNameParams({required this.firstName, required this.lastName});

  @override
  List<Object?> get props => [firstName, lastName];
}

class UpdateNameUseCase {
  final SettingsRepo settingsRepo;

  const UpdateNameUseCase({required this.settingsRepo});
  Future<Either<Failure, void>> call(UpdateNameParams params) {
    return settingsRepo.updateName(
      firstName: params.firstName,
      lastName: params.lastName,
    );
  }
}
