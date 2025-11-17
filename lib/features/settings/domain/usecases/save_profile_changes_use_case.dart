import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';
import 'package:waster/features/settings/domain/repo/settings_repo.dart';

class SaveProfileChangesUseCase {
  final SettingsRepo settingsRepo;

  const SaveProfileChangesUseCase({required this.settingsRepo});

  Future<Either<Failure, List<String>>> call(
    Map<String, dynamic> changes,
  ) async {
    if (changes.isEmpty) {
      return left(Failure('No changes detected'));
    }

    final successMessages = <String>[];
    Failure? lastFailure;

    if (changes.containsKey('name')) {
      final nameData = changes['name'] as Map<String, dynamic>;
      final result = await settingsRepo.updateName(
        firstName: nameData['firstName'],
        lastName: nameData['lastName'],
      );

      result.fold(
        (failure) => lastFailure = failure,
        (_) => successMessages.add('Name updated'),
      );
    }

    if (changes.containsKey('phone')) {
      final result = await settingsRepo.updatePhoneNumber(
        phoneNum: changes['phone'],
      );

      result.fold(
        (failure) => lastFailure = failure,
        (_) => successMessages.add('Phone updated'),
      );
    }

    if (changes.containsKey('location')) {
      final result = await settingsRepo.updateLocation(
        address: changes['location'],
      );

      result.fold(
        (failure) => lastFailure = failure,
        (_) => successMessages.add('Location updated'),
      );
    }

    if (changes.containsKey('bio')) {
      final result = await settingsRepo.updateBio(bio: changes['bio']);

      result.fold(
        (failure) => lastFailure = failure,
        (_) => successMessages.add('Bio updated'),
      );
    }

    if (lastFailure != null && successMessages.isEmpty) {
      return left(lastFailure!);
    }

    return right(successMessages);
  }
}
