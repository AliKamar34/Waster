import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_button.dart';

class CompleteProfileDialog extends StatelessWidget {
  const CompleteProfileDialog({
    super.key,
    required this.onCompleteNow,
    required this.onLater,
  });

  final VoidCallback onCompleteNow;
  final VoidCallback onLater;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: Theme.of(context).extension<AppColors>()!.whiteColor,
      icon: CircleAvatar(
        radius: 40.r,
        backgroundColor: Theme.of(
          context,
        ).extension<AppColors>()!.orangeColor.withAlpha(50),
        child: SvgPicture.asset(
          Assets.profile,
          width: 40.w,
          colorFilter: ColorFilter.mode(
            Theme.of(context).extension<AppColors>()!.orangeColor,
            BlendMode.srcIn,
          ),
        ),
      ),
      iconPadding: EdgeInsets.only(top: 24.h, bottom: 16.h),
      title: Text(
        LocaleKeys.complete_your_profile.tr(),
        textAlign: TextAlign.center,
        style: AppTextStyle.styleBold20(context),
      ),
      titlePadding: EdgeInsets.symmetric(horizontal: 24.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.complete_profile_message.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyle.styleRegular16(context),
          ),
          SizedBox(height: 8.h),
          Text(
            LocaleKeys.complete_profile_benefits.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyle.styleRegular14(context).copyWith(
              color: Theme.of(context).extension<AppColors>()!.greyTextColor,
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            spacing: 12.h,
            children: [
              CustomButton(
                title: LocaleKeys.complete_now.tr(),
                onPressed: onCompleteNow,
                backgroundColor: Theme.of(
                  context,
                ).extension<AppColors>()!.primaryColor,
              ),
              CustomButton(
                title: LocaleKeys.later.tr(),
                onPressed: onLater,
                backgroundColor: Theme.of(
                  context,
                ).extension<AppColors>()!.orangeColor,
              ),
            ],
          ),
        ),
      ],
      actionsPadding: EdgeInsets.zero,
    );
  }
}

void showCompleteProfileDialogWithAnimation(
  BuildContext context, {
  required VoidCallback onCompleteNow,
  required VoidCallback onLater,
}) {
  showGeneralDialog(
    context: context,
    barrierLabel: 'Complete Profile',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 300),

    pageBuilder: (context, animation, secondaryAnimation) {
      return CompleteProfileDialog(
        onCompleteNow: onCompleteNow,
        onLater: onLater,
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final scaleAnimation = Tween<double>(
        begin: 0.8,
        end: 1.0,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutBack));
      final fadeAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));
      return ScaleTransition(
        scale: scaleAnimation,
        child: FadeTransition(opacity: fadeAnimation, child: child),
      );
    },
  );
}
