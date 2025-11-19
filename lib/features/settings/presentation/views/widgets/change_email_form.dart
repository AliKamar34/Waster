import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/auth/presentation/views/widgets/email_text_field.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';
import 'package:waster/features/settings/presentation/views/widgets/change_password_text_field.dart';

class ChangeEmailForm extends StatefulWidget {
  const ChangeEmailForm({super.key});

  @override
  State<ChangeEmailForm> createState() => _ChangeEmailFormState();
}

class _ChangeEmailFormState extends State<ChangeEmailForm> {
  bool isPasswordVisible = true;

  final _formKey = GlobalKey<FormState>();
  final newEmailController = TextEditingController();
  final passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    newEmailController.dispose();
    passwordController.dispose();
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
                  EmailTextField(emailController: newEmailController),
                  ChangePasswordTextField(
                    lable: LocaleKeys.Current_Password.tr(),
                    hint: LocaleKeys.Enter_Your_Current_Password.tr(),
                    isPassword: isPasswordVisible,
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    passwordController: passwordController,
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
                    ChangeEmailEvent(
                      newEmail: newEmailController.text,
                      password: passwordController.text,
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
