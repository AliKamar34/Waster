import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';

class ProfileEditingFormController {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController locationController;
  late final TextEditingController bioController;

  PhoneNumber? _completePhoneNumber;

  String? get completePhoneNumber => _completePhoneNumber?.completeNumber;

  final String _originalName;
  final String _originalEmail;
  final String _originalPhone;
  final String _originalLocation;
  final String _originalBio;

  ProfileEditingFormController(UserEntity user)
    : _originalName = user.fullName,
      _originalEmail = user.email,
      _originalPhone = user.phoneNumber ?? LocaleKeys.phone_number.tr(),
      _originalLocation = user.address ?? LocaleKeys.Enter_valid_address.tr(),
      _originalBio = user.bio ?? '' {
    nameController = TextEditingController(text: _originalName);
    emailController = TextEditingController(text: _originalEmail);
    phoneController = TextEditingController(text: _originalPhone);
    locationController = TextEditingController(text: _originalLocation);
    bioController = TextEditingController(text: _originalBio);
  }

  void updatePhoneNumber(PhoneNumber phoneNumber) {
    _completePhoneNumber = phoneNumber;
  }

  (String firstName, String lastName) parseFullName(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.isEmpty) return ('', '');
    if (parts.length == 1) return (parts[0], '');
    return (parts.first, parts.sublist(1).join(' '));
  }

  Map<String, dynamic> getChanges() {
    final changes = <String, dynamic>{};

    if (nameController.text.trim() != _originalName) {
      final (firstName, lastName) = parseFullName(nameController.text);
      changes['name'] = {'firstName': firstName, 'lastName': lastName};
    }

    if (_completePhoneNumber != null &&
        _completePhoneNumber!.completeNumber != _originalPhone) {
      changes['phone'] = _completePhoneNumber!.completeNumber;
    }

    if (locationController.text.trim() != _originalLocation) {
      changes['location'] = locationController.text.trim();
    }

    if (bioController.text.trim() != _originalBio) {
      changes['bio'] = bioController.text.trim();
    }

    return changes;
  }

  bool get hasChanges => getChanges().isNotEmpty;

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    bioController.dispose();
    _completePhoneNumber = null;
  }
}
