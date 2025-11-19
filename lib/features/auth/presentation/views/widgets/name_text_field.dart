import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_text_field.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key,
    required TextEditingController fullNameController,
  }) : _fullNameController = fullNameController;

  final TextEditingController _fullNameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      lable: LocaleKeys.full_Name.tr(),
      hint: LocaleKeys.enter_your_full_name.tr(),
      controller: _fullNameController,
      validator: Validators.normal,
      prefixIcon: SvgPicture.asset(
        Assets.profile,
        colorFilter: ColorFilter.mode(
          Theme.of(context).extension<AppColors>()!.greyTextColor,
          BlendMode.srcIn,
        ),
        width: 24.sp,
      ),
    );
  }
}
