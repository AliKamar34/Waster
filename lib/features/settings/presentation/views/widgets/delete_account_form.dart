import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';
import 'package:waster/features/settings/presentation/views/widgets/change_password_text_field.dart';

class DeleteAccountForm extends StatefulWidget {
  const DeleteAccountForm({super.key});

  @override
  State<DeleteAccountForm> createState() => _DeleteAccountFormState();
}

class _DeleteAccountFormState extends State<DeleteAccountForm> {
  bool isPasswordVisible = true;

  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
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
          children: [
            SizedBox(height: 240.h),
            CustomContainer(
              child: Column(
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
                    passwordController: passwordController,
                  ),
                  SizedBox(height: 40.h),
                  CustomButton(
                    backgroundColor: Theme.of(
                      context,
                    ).extension<AppColors>()!.redColor,

                    title: LocaleKeys.Delete_Account.tr(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        BlocProvider.of<SettingsBloc>(context).add(
                          DeleteAccountEvent(password: passwordController.text),
                        );
                        BlocProvider.of<AuthBloc>(
                          context,
                        ).add(const RefreshTokenEvent());
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
                ],
              ),
            ),

            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
