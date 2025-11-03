import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:waster/features/settings/presentation/views/widgets/custom_alert.dart';

class CustomLogOutContainer extends StatelessWidget {
  const CustomLogOutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: CustomButton(
        backgroundColor: Theme.of(context).extension<AppColors>()!.redColor,
        icon: SvgPicture.asset(Assets.logOut),
        title: LocaleKeys.sign_out.tr(),
        onPressed: () {
          showLogOutDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showLogOutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomAlert(
          content: LocaleKeys.Are_U_Sure_You_Want_To_Sign_Out.tr(),
          title: LocaleKeys.sign_out.tr(),
          button1: CustomButton(
            title: LocaleKeys.cancle.tr(),
            onPressed: () {
              context.pop();
            },
          ),
          button2: CustomButton(
            title: LocaleKeys.sign_out.tr(),
            backgroundColor: Theme.of(context).extension<AppColors>()!.redColor,
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(const LogoutEvent());
              context.pop();
            },
          ),
        );
      },
    );
  }
}
