import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_text_field.dart';

class LocationTextField extends StatelessWidget {
  const LocationTextField({
    super.key,
    required TextEditingController locationController,
  }) : _locationController = locationController;

  final TextEditingController _locationController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      keyboardType: TextInputType.text,
      lable: LocaleKeys.Location.tr(),
      hint: LocaleKeys.City_State.tr(),
      controller: _locationController,
      validator: Validators.fullAddress,
      prefixIcon: SvgPicture.asset(Assets.location, width: 24.sp),
    );
  }
}
