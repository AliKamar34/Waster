import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';

class CustomSwithcher extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwithcher({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 51,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.5),
          color: value
              ? Theme.of(context).extension<AppColors>()!.primaryColor
              : Theme.of(
                  context,
                ).extension<AppColors>()!.greyTextColor.withAlpha(100),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 21,
            height: 21,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
