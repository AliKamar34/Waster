import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:waster/features/auth/presentation/views/widgets/email_text_field.dart';
import 'package:waster/features/auth/presentation/views/widgets/password_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPassword = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 24.w,
      backgroundColor: Theme.of(context).extension<AppColors>()!.whiteColor,
      borderColor: Theme.of(context).extension<AppColors>()!.borderColor,
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 16,
          children: [
            EmailTextField(emailController: emailController),
            PasswordTextField(
              isPassword: isPassword,
              onTap: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
              passwordController: passwordController,
            ),
            CustomButton(
              title: LocaleKeys.Sign_in.tr(),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  BlocProvider.of<AuthBloc>(context).add(
                    LoginEvent(
                      email: emailController.text,
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
          ],
        ),
      ),
    );
  }
}
