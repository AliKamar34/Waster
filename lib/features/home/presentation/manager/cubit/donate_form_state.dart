import 'dart:io';

import 'package:equatable/equatable.dart';

class DonateFormState extends Equatable {
  final File? image;
  final String? category;
  final String? unit;
  final String? expiresOn;
  final bool isValid;
  final String? errorMessage;

  const DonateFormState({
    this.image,
    this.category,
    this.unit,
    this.expiresOn,
    this.isValid = false,
    this.errorMessage,
  });

  factory DonateFormState.initial() => const DonateFormState();

  DonateFormState copyWith({
    File? image,
    String? category,
    String? unit,
    String? expiresOn,
    bool? isValid,
    String? errorMessage,
  }) {
    return DonateFormState(
      image: image ?? this.image,
      category: category ?? this.category,
      unit: unit ?? this.unit,
      expiresOn: expiresOn ?? this.expiresOn,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    image,
    category,
    unit,
    expiresOn,
    isValid,
    errorMessage,
  ];
}
