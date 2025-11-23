part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

final class SettingsDeletingAccountSuccess extends SettingsState {
  const SettingsDeletingAccountSuccess();
}

final class SettingsDeletingAccuntFailure extends SettingsState {
  final String message;

  const SettingsDeletingAccuntFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class SettingsLoading extends SettingsState {
  const SettingsLoading();
}

final class UserDetailsLoaded extends SettingsState {
  final UserEntity user;

  const UserDetailsLoaded(this.user);

  @override
  List<Object> get props => [user];
}

final class SettingsUpdateSuccess extends SettingsState {
  final String message;

  const SettingsUpdateSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class SettingsFailure extends SettingsState {
  final String message;

  const SettingsFailure(this.message);

  @override
  List<Object> get props => [message];
}
