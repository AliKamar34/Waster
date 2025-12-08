import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key, required this.location});
  final String location;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.Location.tr(),
            style: AppTextStyle.styleRegular16(context),
          ),
          SizedBox(height: 20.h, width: double.infinity),
          Text(location, style: AppTextStyle.styleRegular16(context)),
        ],
      ),
    );
  }
}
