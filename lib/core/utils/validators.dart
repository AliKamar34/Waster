import 'package:easy_localization/easy_localization.dart';
import 'package:waster/core/localization/locale_keys.g.dart';

class Validators {
  /// Normal validation
  static String? normal(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.This_field_is_required.tr();
    }
    return null;
  }

  /// Email validation
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.Email_is_required.tr();
    }
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!emailRegex.hasMatch(value.trim())) {
      return LocaleKeys.Invalid_email_format.tr();
    }
    return null;
  }

  /// Password validation
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.Password_is_required.tr();
    }
    if (value.length < 8) {
      return LocaleKeys.Password_must_be_at_least_8_characters_long.tr();
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return LocaleKeys
          .Password_must_contain_at_least_one_lowercase_letter.tr();
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return LocaleKeys
          .Password_must_contain_at_least_one_uppercase_letter.tr();
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return LocaleKeys.Password_must_contain_at_least_one_number.tr();
    }
    if (!RegExp(
      r'[!@#\$%\^&\*\(\)_\+\-=\[\]\{\};:"\\|,.<>\/\?]',
    ).hasMatch(value)) {
      return LocaleKeys
          .Password_must_contain_at_least_one_special_character.tr();
    }
    return null;
  }

  /// Confirm Password validation
  static String? confirmPassword(String? value, String? original) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.Confirm_Password_is_required.tr();
    }
    if (value != original) {
      return LocaleKeys.Passwords_do_not_match.tr();
    }
    return null;
  }

  /// adress validation
  static String? fullAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.This_field_is_required.tr();
    }

    List<String> parts = value.split(',').map((e) => e.trim()).toList();

    if (parts.length < 3) {
      parts = value.split(RegExp(r'\s+')).map((e) => e.trim()).toList();
    }

    if (parts.length < 3) {
      return LocaleKeys.Enter_full_address_including_city_and_state.tr();
    }

    if (parts.any((part) => part.isEmpty)) {
      return LocaleKeys.Enter_valid_address.tr();
    }

    return null;
  }
}
