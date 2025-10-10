import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class MembersinceWidget extends StatelessWidget {
  const MembersinceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'Member since',
              style: AppTextStyle.styleRegular14(context),
            ),
          ),
          Center(
            child: Text(
              'March 2024',
              style: AppTextStyle.styleRegular16(context),
            ),
          ),
        ],
      ),
    );
  }
}
