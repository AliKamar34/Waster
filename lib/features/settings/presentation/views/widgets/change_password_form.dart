import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';
import 'package:waster/features/settings/presentation/views/widgets/change_password_text_field.dart';
import 'package:waster/features/settings/presentation/views/widgets/confirm_change_password_text_field.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  bool isPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  final _formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          spacing: 8,
          children: [
            SizedBox(height: 240.h),
            CustomContainer(
              child: Column(
                spacing: 24,
                children: [
                  ChangePasswordTextField(
                    lable: LocaleKeys.Current_Password.tr(),
                    hint: LocaleKeys.Enter_Your_Current_Password.tr(),
                    isPassword: isPasswordVisible,
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    passwordController: currentPasswordController,
                  ),
                  ChangePasswordTextField(
                    lable: LocaleKeys.New_Password.tr(),
                    hint: LocaleKeys.Enter_Your_New_Password.tr(),
                    isPassword: isNewPasswordVisible,
                    onTap: () {
                      setState(() {
                        isNewPasswordVisible = !isNewPasswordVisible;
                      });
                    },
                    passwordController: newPasswordController,
                  ),
                  ConfirmChangePasswordTextField(
                    isConfirmPassword: isConfirmPasswordVisible,
                    onTap: () {
                      setState(() {
                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                      });
                    },
                    passwordController: newPasswordController,
                    confirmPasswordController: confirmPasswordController,
                  ),
                ],
              ),
            ),
            SizedBox(height: 120.h),
            CustomButton(
              title: LocaleKeys.save.tr(),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  BlocProvider.of<SettingsBloc>(context).add(
                    ChangePasswordEvent(
                      currentPassword: currentPasswordController.text,
                      newPassword: newPasswordController.text,
                      confirmPassword: confirmPasswordController.text,
                    ),
                  );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
            CustomButton(
              backgroundColor: Theme.of(
                context,
              ).extension<AppColors>()!.blueColor,
              title: LocaleKeys.cancle.tr(),
              onPressed: () {
                context.pop();
              },
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
