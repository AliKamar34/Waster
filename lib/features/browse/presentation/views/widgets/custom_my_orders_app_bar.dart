import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomMyOrdersAppBar extends StatelessWidget {
  const CustomMyOrdersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.2),
        Center(
          child: Text('My Orders', style: AppTextStyle.styleBold20(context)),
        ),
      ],
    );
  }
}
