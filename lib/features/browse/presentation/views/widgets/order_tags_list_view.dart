import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class OrderTagsListView extends StatelessWidget {
  const OrderTagsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 4),
            child: CustomContainer(
              padding: 4,
              borderWidth: 1.5,
              borderRadius: 8,
              borderColor: AppColors.borderColor,
              child: Text(
                'Beverages',
                style: AppTextStyle.styleRegular14(context),
              ),
            ),
          );
        },
      ),
    );
  }
}
