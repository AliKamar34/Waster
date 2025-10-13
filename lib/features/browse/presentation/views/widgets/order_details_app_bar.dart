import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class OrderDetailsAppBar extends StatelessWidget {
  const OrderDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        Center(
          child: Text(
            'Order Details',
            style: AppTextStyle.styleBold20(context),
          ),
        ),
        const Spacer(),
        CustomContainer(
          padding: 2,
          borderRadius: 8,
          backgroundColor: AppColors.orangeColor,
          child: Row(
            spacing: 4,
            children: [
              SvgPicture.asset(
                Assets.pending,
                colorFilter: ColorFilter.mode(
                  AppColors.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                'pending',
                style: AppTextStyle.styleRegular14(
                  context,
                ).copyWith(color: AppColors.whiteColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
