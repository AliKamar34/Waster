import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/core/widgets/custom_phone_number_feild.dart';
import 'package:waster/features/auth/data/models/roles_enum.dart';
import 'package:waster/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:waster/features/auth/presentation/views/widgets/confirm_password_text_field.dart';
import 'package:waster/features/auth/presentation/views/widgets/email_text_field.dart';
import 'package:waster/features/auth/presentation/views/widgets/location_text_field.dart';
import 'package:waster/features/auth/presentation/views/widgets/name_text_field.dart';
import 'package:waster/features/auth/presentation/views/widgets/password_text_field.dart';
import 'package:waster/features/auth/presentation/views/widgets/roles_drop_down_widget.dart';
import 'package:waster/features/auth/presentation/views/widgets/terms_and_privacy.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;
  bool _isTermsAccepted = false;
  RolesEnum? _selectedRole;
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _locationController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  PhoneNumber? _completePhoneNumber;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _locationController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  //  Helper Methods
  (String, String) _parseFullName(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.isEmpty) return ('', '');
    if (parts.length == 1) return (parts[0], '');
    return (parts.first, parts.sublist(1).join(' '));
  }

  void _handleRegister() {
    if (!_formKey.currentState!.validate()) return;

    if (!_isTermsAccepted) {
      showToast(context, LocaleKeys.pls_confirm_terms_and_privacy.tr());
      return;
    }

    if (_completePhoneNumber == null) {
      showToast(context, LocaleKeys.please_enter_your_phone_number.tr());
      return;
    }

    final (firstName, lastName) = _parseFullName(_fullNameController.text);

    context.read<AuthBloc>().add(
      RegisterEvent(
        firstName: firstName,
        lastName: lastName,
        email: _emailController.text.trim(),
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        phoneNumber: _completePhoneNumber!.completeNumber,
        address: _locationController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 24,
      backgroundColor: Theme.of(context).extension<AppColors>()!.whiteColor,
      borderColor: Theme.of(context).extension<AppColors>()!.borderColor,
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 16,
          children: [
            NameTextField(fullNameController: _fullNameController),
            EmailTextField(emailController: _emailController),
            CustomPhoneNumberFeild(
              controller: _phoneNumberController,
              onChanged: (PhoneNumber phoneNumber) {
                setState(() {
                  _completePhoneNumber = phoneNumber;
                });
              },
            ),
            RolesDropDownWidget(
              selectedRole: _selectedRole,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value;
                });
              },
            ),
            LocationTextField(locationController: _locationController),
            PasswordTextField(
              isPassword: _isPasswordVisible,
              passwordController: _passwordController,
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            ConfirmPasswordTextField(
              isConfirmPassword: _isConfirmPasswordVisible,
              onTap: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
              confirmPasswordController: _confirmPasswordController,
              passwordController: _passwordController,
            ),
            TermsAndPrivacy(
              isChecked: _isTermsAccepted,
              onChanged: (value) {
                setState(() {
                  _isTermsAccepted = value!;
                });
              },
            ),
            CustomButton(
              title: LocaleKeys.Create_Account.tr(),
              onPressed: _handleRegister,
            ),
          ],
        ),
      ),
    );
  }
}
