import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/features/auth/presentation/manager/bloc/auth_bloc.dart';

class GoogleSection extends StatelessWidget {
  const GoogleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Or continue with',
                style: AppTextStyle.styleBold16(context),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        CustomButton(
          icon: SvgPicture.asset(Assets.google, width: 24.w),
          title: 'google',
          backgroundColor: Theme.of(
            context,
          ).extension<AppColors>()!.orangeColor,
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(const GoogleSignInEvent());
          },
        ),
      ],
    );
  }
}
