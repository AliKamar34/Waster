import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomLogOutContainer extends StatelessWidget {
  const CustomLogOutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: CustomButton(
        backgroundColor: Theme.of(context).extension<AppColors>()!.redColor,
        icon: SvgPicture.asset(Assets.logOut),
        title: LocaleKeys.sign_out.tr(),
        onPressed: () {},
      ),
    );
  }
}
