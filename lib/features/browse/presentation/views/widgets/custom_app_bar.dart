import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/themes/app_text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.needSpace});
  final String title;
  final bool? needSpace;
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
        needSpace == true ? SizedBox(width: 60.w) : const SizedBox.shrink(),
        Center(child: Text(title, style: AppTextStyle.styleBold20(context))),
      ],
    );
  }
}
