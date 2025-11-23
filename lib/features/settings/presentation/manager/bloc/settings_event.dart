part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

final class GetUserDetailsEvent extends SettingsEvent {
  const GetUserDetailsEvent();
}

final class DeleteAccountEvent extends SettingsEvent {
  final String password;
  const DeleteAccountEvent({required this.password});
  @override
  List<Object> get props => [password];
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
