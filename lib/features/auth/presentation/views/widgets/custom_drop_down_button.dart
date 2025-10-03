import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/features/auth/data/models/roles_enum.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({super.key, this.validator});
  final String? Function(RolesEnum?)? validator;
  @override
  Widget build(BuildContext context) {
    RolesEnum? selectedValue;
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('I want to', style: AppTextStyle.styleRegular16(context)),
        DropdownButtonFormField<RolesEnum>(
          value: selectedValue,
          hint: Text(
            'Select your role',
            style: AppTextStyle.styleRegular16(context),
          ),
          validator: validator,
          onChanged: (_) {},
          items: const [
            DropdownMenuItem(value: RolesEnum.donor, child: Text('Donor')),
            DropdownMenuItem(
              value: RolesEnum.recipient,
              child: Text('Resipient'),
            ),
            DropdownMenuItem(
              value: RolesEnum.volunteer,
              child: Text('Volunteer'),
            ),
          ],
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.scaffoldColor,
            border: borderBuilder(),
            enabledBorder: borderBuilder(),
            focusedBorder: borderBuilder(),
            errorBorder: borderBuilder().copyWith(
              borderSide: const BorderSide(color: AppColors.redColor),
            ),
            focusedErrorBorder: borderBuilder().copyWith(
              borderSide: const BorderSide(color: AppColors.redColor),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
          icon: const RotatedBox(
            quarterTurns: 3,
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
          dropdownColor: AppColors.scaffoldColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ],
    );
  }

  OutlineInputBorder borderBuilder() {
    return OutlineInputBorder(
      gapPadding: 18,
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.scaffoldColor),
    );
  }
}
