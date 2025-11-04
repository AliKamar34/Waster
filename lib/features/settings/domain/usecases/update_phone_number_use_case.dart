import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';

class UpdatePhoneNumberParams extends Equatable {
  final String phoneNum;

  const UpdatePhoneNumberParams({required this.phoneNum});

  @override
  List<Object?> get props => [phoneNum];
}

class UpdatePhoneNumberUseCase {
  final SettingsRepo settingsRepo;

  const UpdatePhoneNumberUseCase({required this.settingsRepo});
  Future<Either<Failure, void>> call(UpdatePhoneNumberParams params) {
    return settingsRepo.updatePhoneNumber(phoneNum: params.phoneNum);
  }
}
