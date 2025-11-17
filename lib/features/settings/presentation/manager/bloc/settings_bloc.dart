import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/usecases/use_cases.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';
import 'package:waster/features/settings/domain/usecases/change_email_use_case.dart';
import 'package:waster/features/settings/domain/usecases/change_password_use_case.dart';
import 'package:waster/features/settings/domain/usecases/get_user_details_use_case.dart';
import 'package:waster/features/settings/domain/usecases/save_profile_changes_use_case.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetUserDetailsUseCase getUserDetailsUseCase;
  final SaveProfileChangesUseCase saveProfileChangesUseCase;
  final ChangeEmailUseCase changeEmailUseCase;
  final ChangePasswordUseCase changePasswordUseCase;

  SettingsBloc({
    required this.getUserDetailsUseCase,
    required this.saveProfileChangesUseCase,
    required this.changeEmailUseCase,
    required this.changePasswordUseCase,
  }) : super(const SettingsInitial()) {
    on<GetUserDetailsEvent>(_onGetUserDetails);
    on<SaveProfileChangesEvent>(_onSaveProfileChanges);
    on<ChangeEmailEvent>(_onChangeEmail);
    on<ChangePasswordEvent>(_onChangePassword);
  }

  Future<void> _onGetUserDetails(
    GetUserDetailsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsLoading());
    final result = await getUserDetailsUseCase.call(NoParams());
    result.fold(
      (failure) => emit(SettingsFailure(failure.message)),
      (userEntity) => emit(UserDetailsLoaded(userEntity)),
    );
  }

  Future<void> _onSaveProfileChanges(
    SaveProfileChangesEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsLoading());

    final result = await saveProfileChangesUseCase.call(event.changes);

    result.fold((failure) => emit(SettingsFailure(failure.message)), (
      successMessages,
    ) {
      emit(SettingsUpdateSuccess(successMessages.join(', ')));
      add(const GetUserDetailsEvent());
    });
  }

  Future<void> _onChangeEmail(
    ChangeEmailEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsLoading());
    final result = await changeEmailUseCase.call(
      ChangeEmailParams(newEmail: event.newEmail, password: event.password),
    );
    result.fold((failure) => emit(SettingsFailure(failure.message)), (_) {
      emit(const SettingsUpdateSuccess('Email changed successfully'));
      add(const GetUserDetailsEvent());
    });
  }

  Future<void> _onChangePassword(
    ChangePasswordEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsLoading());
    final result = await changePasswordUseCase.call(
      ChangePasswordParams(
        currentPassword: event.currentPassword,
        newPassword: event.newPassword,
        confirmPassword: event.confirmPassword,
      ),
    );
    result.fold((failure) => emit(SettingsFailure(failure.message)), (_) {
      emit(const SettingsUpdateSuccess('Password changed successfully'));
      add(const GetUserDetailsEvent());
    });
  }
}

// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:waster/core/usecases/use_cases.dart';
// import 'package:waster/features/settings/domain/entity/user_entity.dart';
// import 'package:waster/features/settings/domain/usecases/change_email_use_case.dart';
// import 'package:waster/features/settings/domain/usecases/change_password_use_case.dart';
// import 'package:waster/features/settings/domain/usecases/get_user_details_use_case.dart';
// import 'package:waster/features/settings/domain/usecases/update_bio_use_case.dart';
// import 'package:waster/features/settings/domain/usecases/update_location_use_case.dart';
// import 'package:waster/features/settings/domain/usecases/update_name_use_case.dart';
// import 'package:waster/features/settings/domain/usecases/update_phone_number_use_case.dart';

// part 'settings_event.dart';
// part 'settings_state.dart';

// class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
//   final GetUserDetailsUseCase getUserDetailsUseCase;
//   final UpdateNameUseCase updateNameUseCase;
//   final UpdateBioUseCase updateBioUseCase;
//   final UpdateLocationUseCase updateLocationUseCase;
//   final UpdatePhoneNumberUseCase updatePhoneNumberUseCase;
//   final ChangeEmailUseCase changeEmailUseCase;
//   final ChangePasswordUseCase changePasswordUseCase;
//   SettingsBloc({
//     required this.getUserDetailsUseCase,
//     required this.updateNameUseCase,
//     required this.updateBioUseCase,
//     required this.updateLocationUseCase,
//     required this.updatePhoneNumberUseCase,
//     required this.changeEmailUseCase,
//     required this.changePasswordUseCase,
//   }) : super(const SettingsInitial()) {
//     on<GetUserDetailsEvent>(_onGetUserDetails);
//     on<UpdateNameEvent>(_onUpdateName);
//     on<UpdatePhoneNumberEvent>(_onUpdatePhone);
//     on<UpdateLocationEvent>(_onUpdateLocation);
//     on<UpdateBioEvent>(_onUpdateBio);
//     on<ChangeEmailEvent>(_onChangeEmail);
//     on<ChangePasswordEvent>(_onChangePassword);
//   }

//   Future<void> _onGetUserDetails(
//     GetUserDetailsEvent event,
//     Emitter<SettingsState> emit,
//   ) async {
//     emit(const SettingsLoading());
//     final result = await getUserDetailsUseCase.call(NoParams());
//     result.fold(
//       (failure) {
//         emit(SettingsFailure(failure.message));
//       },
//       (userEntity) {
//         emit(UserDetailsLoaded(userEntity));
//       },
//     );
//   }

//   Future<void> _onUpdateName(
//     UpdateNameEvent event,
//     Emitter<SettingsState> emit,
//   ) async {
//     emit(const SettingsLoading());
//     final result = await updateNameUseCase.call(
//       UpdateNameParams(firstName: event.firstName, lastName: event.lastName),
//     );
//     result.fold(
//       (failure) {
//         emit(SettingsFailure(failure.message));
//       },
//       (_) {
//         emit(const SettingsUpdateSuccess('Name updated successfully'));
//         add(const GetUserDetailsEvent());
//       },
//     );
//   }

//   Future<void> _onUpdatePhone(
//     UpdatePhoneNumberEvent event,
//     Emitter<SettingsState> emit,
//   ) async {
//     emit(const SettingsLoading());
//     final result = await updatePhoneNumberUseCase.call(
//       UpdatePhoneNumberParams(phoneNum: event.phoneNum),
//     );
//     result.fold(
//       (failure) {
//         emit(SettingsFailure(failure.message));
//       },
//       (_) {
//         emit(const SettingsUpdateSuccess('Phone Number updated successfully'));
//         add(const GetUserDetailsEvent());
//       },
//     );
//   }

//   Future<void> _onUpdateLocation(
//     UpdateLocationEvent event,
//     Emitter<SettingsState> emit,
//   ) async {
//     emit(const SettingsLoading());
//     final result = await updateLocationUseCase.call(
//       UpdateLocationParams(address: event.address),
//     );
//     result.fold(
//       (failure) {
//         emit(SettingsFailure(failure.message));
//       },
//       (_) {
//         emit(const SettingsUpdateSuccess('Address updated successfully'));
//         add(const GetUserDetailsEvent());
//       },
//     );
//   }

//   Future<void> _onUpdateBio(
//     UpdateBioEvent event,
//     Emitter<SettingsState> emit,
//   ) async {
//     emit(const SettingsLoading());
//     final result = await updateBioUseCase.call(UpdateBioParams(bio: event.bio));
//     result.fold(
//       (failure) {
//         emit(SettingsFailure(failure.message));
//       },
//       (_) {
//         emit(const SettingsUpdateSuccess('Bio updated successfully'));
//         add(const GetUserDetailsEvent());
//       },
//     );
//   }

//   Future<void> _onChangeEmail(
//     ChangeEmailEvent event,
//     Emitter<SettingsState> emit,
//   ) async {
//     emit(const SettingsLoading());
//     final result = await changeEmailUseCase.call(
//       ChangeEmailParams(newEmail: event.newEmail, password: event.password),
//     );
//     result.fold(
//       (failure) {
//         emit(SettingsFailure(failure.message));
//       },
//       (_) {
//         emit(const SettingsUpdateSuccess('Email changed successfully'));
//         add(const GetUserDetailsEvent());
//       },
//     );
//   }

//   Future<void> _onChangePassword(
//     ChangePasswordEvent event,
//     Emitter<SettingsState> emit,
//   ) async {
//     emit(const SettingsLoading());
//     final result = await changePasswordUseCase.call(
//       ChangePasswordParams(
//         currentPassword: event.currentPassword,
//         newPassword: event.newPassword,
//         confirmPassword: event.confirmPassword,
//       ),
//     );
//     result.fold(
//       (failure) {
//         emit(SettingsFailure(failure.message));
//       },
//       (_) {
//         emit(const SettingsUpdateSuccess('Password changed successfully'));
//         add(const GetUserDetailsEvent());
//       },
//     );
//   }
// }
