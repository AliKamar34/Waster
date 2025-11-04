import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';

class UpdateLocationParams extends Equatable {
  final String address;

  const UpdateLocationParams({required this.address});

  @override
  List<Object?> get props => [address];
}

class UpdateLocationUseCase {
  final SettingsRepo settingsRepo;

  const UpdateLocationUseCase({required this.settingsRepo});
  Future<Either<Failure, void>> call(UpdateLocationParams params) {
    return settingsRepo.updateLocation(address: params.address);
  }
}
