import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/utils/show_overlay_toast.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/features/claim/presentation/views/widgets/donor_iformation_list_tile.dart';
import 'package:waster/features/claim/domain/entity/claim_user_entity.dart';

class CustomOwnerDialog extends StatelessWidget {
  const CustomOwnerDialog({super.key, required this.owner});

  final ClaimUserEntity owner;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      backgroundColor: colors.scaffoldColor,
      icon: CircleAvatar(
        radius: 40,
        backgroundColor: colors.blueColor,
        child: const Icon(Icons.info, color: Colors.white, size: 32),
      ),
      iconPadding: EdgeInsets.symmetric(vertical: 40.w),
      title: Text(
        LocaleKeys.ownerInfo.tr(),
        style: AppTextStyle.styleBold20(context),
      ),
      titlePadding: EdgeInsets.only(bottom: 10.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 40.h),
      content: DonorIformationListTile(claimUserEntity: owner),

      actionsPadding: EdgeInsets.all(20.w),
      actions: [
        CustomButton(
          title: 'whatsapp',
          onPressed: () async {
            try {
              await _openWhatsApp();
            } catch (e) {
              if (context.mounted) {
                showOverlayToast(context, e.toString(), isError: true);
              }
            }
          },
        ),
        CustomButton(
          backgroundColor: colors.blueColor,
          title: LocaleKeys.cancle.tr(),
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }

  Future<void> _openWhatsApp() async {
    final phone = owner.phoneNumber.replaceAll('+', '').replaceAll(' ', '');
    final text = Uri.encodeComponent(
      'Hello ${owner.fullName}, I am contacting you regarding the claimed post.',
    );

    // Native WhatsApp
    final Uri whatsappRegular = Uri.parse(
      'whatsapp://send?phone=$phone&text=$text',
    );

    // WhatsApp Business
    final Uri whatsappBusiness = Uri.parse(
      'whatsapp-business://send?phone=$phone&text=$text',
    );

    if (await canLaunchUrl(whatsappRegular)) {
      await launchUrl(whatsappRegular, mode: LaunchMode.externalApplication);
      return;
    }

    if (await canLaunchUrl(whatsappBusiness)) {
      await launchUrl(whatsappBusiness, mode: LaunchMode.externalApplication);
      return;
    }

    throw 'Could not launch WhatsApp';
  }
}
