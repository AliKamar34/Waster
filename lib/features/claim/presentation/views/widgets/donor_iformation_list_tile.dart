import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/features/claim/domain/entity/claim_user_entity.dart';

class DonorIformationListTile extends StatelessWidget {
  const DonorIformationListTile({super.key, required this.claimUserEntity});
  final ClaimUserEntity claimUserEntity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 22.r,
        backgroundColor: Theme.of(context).extension<AppColors>()!.primaryColor,
        child: const Text('SB'),
      ),
      title: Text(
        claimUserEntity.fullName,
        style: AppTextStyle.styleRegular14(context).copyWith(
          color: Theme.of(context).extension<AppColors>()!.blackTextColor,
        ),
      ),
      subtitle: Column(
        spacing: 6,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            claimUserEntity.email,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.styleRegular14(context).copyWith(
              color: Theme.of(context).extension<AppColors>()!.blackTextColor,
            ),
          ),
          Text(
            claimUserEntity.address,
            style: AppTextStyle.styleRegular14(context).copyWith(
              color: Theme.of(context).extension<AppColors>()!.blackTextColor,
            ),
          ),
        ],
      ),
      trailing: InkWell(
        onTap: _makeCall,
        child: CustomContainer(
          padding: 8.w,
          child: SvgPicture.asset(Assets.phone),
        ),
      ),
    );
  }

  Future<void> _makeCall() async {
    final Uri callUri = Uri(scheme: 'tel', path: claimUserEntity.phoneNumber);

    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Can\'t launch call ';
    }
  }
}
