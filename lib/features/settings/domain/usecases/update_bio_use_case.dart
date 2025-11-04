import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';

class UpdateBioParams extends Equatable {
  final String bio;

  const UpdateBioParams({required this.bio});

  @override
  List<Object?> get props => [bio];
}

class UpdateBioUseCase {
  final SettingsRepo settingsRepo;

  const UpdateBioUseCase({required this.settingsRepo});
  Future<Either<Failure, void>> call(UpdateBioParams params) {
    return settingsRepo.updateBio(bio: params.bio);
  }
}
