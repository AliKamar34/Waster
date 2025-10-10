import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomLogOutContainer extends StatelessWidget {
  const CustomLogOutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: CustomButton(
        backgroundColor: AppColors.redColor,
        icon: SvgPicture.asset(Assets.logOut),
        title: 'Sign Out',
        onPressed: () {},
      ),
    );
  }
}
