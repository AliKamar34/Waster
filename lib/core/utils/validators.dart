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
  static String? password(String? value) => PasswordValidator.validate(value);

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

class PasswordValidator {
  static const int minLength = 8;
  static const bool requireLowercase = true;
  static const bool requireUppercase = true;
  static const bool requireDigit = true;
  static const bool requireSpecialChar = true;

  static final RegExp _lowercaseRegex = RegExp(r'[a-z]');
  static final RegExp _uppercaseRegex = RegExp(r'[A-Z]');
  static final RegExp _digitRegex = RegExp(r'\d');
  static final RegExp _specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.Password_is_required.tr();
    }

    if (value.length < minLength) {
      return LocaleKeys.Password_must_be_at_least_8_characters_long.tr();
    }

    if (requireLowercase && !_lowercaseRegex.hasMatch(value)) {
      return LocaleKeys
          .Password_must_contain_at_least_one_lowercase_letter.tr();
    }

    if (requireUppercase && !_uppercaseRegex.hasMatch(value)) {
      return LocaleKeys
          .Password_must_contain_at_least_one_uppercase_letter.tr();
    }

    if (requireDigit && !_digitRegex.hasMatch(value)) {
      return LocaleKeys.Password_must_contain_at_least_one_number.tr();
    }

    if (requireSpecialChar && !_specialCharRegex.hasMatch(value)) {
      return LocaleKeys
          .Password_must_contain_at_least_one_special_character.tr();
    }

    return null;
  }

  static PasswordStrength getStrength(String password) {
    if (password.isEmpty) return PasswordStrength.none;

    int score = 0;
    if (password.length >= 8) score++;
    if (password.length >= 12) score++;
    if (_lowercaseRegex.hasMatch(password)) score++;
    if (_uppercaseRegex.hasMatch(password)) score++;
    if (_digitRegex.hasMatch(password)) score++;
    if (_specialCharRegex.hasMatch(password)) score++;

    if (score <= 2) return PasswordStrength.weak;
    if (score <= 4) return PasswordStrength.medium;
    return PasswordStrength.strong;
  }
}

enum PasswordStrength { none, weak, medium, strong }
