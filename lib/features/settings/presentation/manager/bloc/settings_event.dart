part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

final class GetUserDetailsEvent extends SettingsEvent {
  const GetUserDetailsEvent();
}

final class UpdateNameEvent extends SettingsEvent {
  final String firstName;
  final String lastName;

  const UpdateNameEvent({required this.firstName, required this.lastName});

  @override
  List<Object> get props => [firstName, lastName];
}

final class UpdateBioEvent extends SettingsEvent {
  final String bio;

  const UpdateBioEvent({required this.bio});

  @override
  List<Object> get props => [bio];
}

final class UpdateLocationEvent extends SettingsEvent {
  final String address;

  const UpdateLocationEvent({required this.address});

  @override
  List<Object> get props => [address];
}

final class UpdatePhoneNumberEvent extends SettingsEvent {
  final String phoneNum;

  const UpdatePhoneNumberEvent({required this.phoneNum});

  @override
  List<Object> get props => [phoneNum];
}

final class ChangeEmailEvent extends SettingsEvent {
  final String newEmail;
  final String password;

  const ChangeEmailEvent({required this.newEmail, required this.password});

  @override
  List<Object> get props => [newEmail, password];
}

final class ChangePasswordEvent extends SettingsEvent {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  const ChangePasswordEvent({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [currentPassword, newPassword, confirmPassword];
}

final class SaveProfileChangesEvent extends SettingsEvent {
  final Map<String, dynamic> changes;

  const SaveProfileChangesEvent(this.changes);

  @override
  List<Object> get props => [changes];
}
