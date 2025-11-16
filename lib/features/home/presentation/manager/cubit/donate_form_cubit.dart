import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/features/home/presentation/manager/cubit/donate_form_state.dart';

class DonateFormCubit extends Cubit<DonateFormState> {
  DonateFormCubit() : super(DonateFormState.initial());

  void updateImage(File? image) {
    emit(state.copyWith(image: image));
    _validateForm();
  }

  void updateCategory(String? category) {
    emit(state.copyWith(category: category));
    _validateForm();
  }

  void updateUnit(String? unit) {
    emit(state.copyWith(unit: unit));
    _validateForm();
  }

  void updateExpiresOn(String? expiresOn) {
    emit(state.copyWith(expiresOn: expiresOn));
    _validateForm();
  }

  void _validateForm() {
    bool isValid = true;
    String? errorMessage;

    if (state.category == null) {
      isValid = false;
      errorMessage = 'Please select category';
    } else if (state.unit == null) {
      isValid = false;
      errorMessage = 'Please select unit';
    } else if (state.image == null) {
      isValid = false;
      errorMessage = 'Please add image';
    } else if (state.expiresOn == null) {
      isValid = false;
      errorMessage = 'Please select expiry date';
    }

    emit(state.copyWith(isValid: isValid, errorMessage: errorMessage));
  }

  void clear() {
    emit(DonateFormState.initial());
  }
}
