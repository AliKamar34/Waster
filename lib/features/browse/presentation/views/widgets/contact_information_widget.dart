import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/browse/presentation/views/widgets/donor_iformation_list_tile.dart';

class ContactInformationWidget extends StatelessWidget {
  const ContactInformationWidget({
    super.key,
    required this.title,
    required this.location,
  });
  final String title, location;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.styleRegular16(context)),
          const DonorIformationListTile(),
          Row(
            children: [
              SvgPicture.asset(Assets.location),
              Text(location, style: AppTextStyle.styleRegular14(context)),
            ],
          ),
        ],
      ),
    );
  }
}
