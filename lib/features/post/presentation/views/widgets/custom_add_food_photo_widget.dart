import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_image_bottom_sheet_picker.dart';
import 'package:waster/core/widgets/custom_light_color_container.dart';

class CustomAddFoodPhotoWidget extends StatelessWidget {
  const CustomAddFoodPhotoWidget({
    super.key,
    required this.pickImage,
    this.removeImage,
    this.image,
    this.imagePath,
  });
  final File? image;
  final String? imagePath;
  final Future<void> Function(bool fromCamera) pickImage;
  final void Function()? removeImage;

  @override
  Widget build(BuildContext context) {
    return CustomLightColorContainer(
      padding: image != null || imagePath != null ? 2.w : 16.w,
      color: Theme.of(context).extension<AppColors>()!.primaryColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: imagePath != null && image == null
            ? Stack(
                children: [
                  CachedNetworkImage(
                    height: 250.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: 'http://waster.runasp.net/$imagePath',
                    errorWidget: (context, url, error) =>
                        _buildUploadUI(context),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(
                        context,
                      ).extension<AppColors>()!.primaryColor,
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(
                            context,
                          ).extension<AppColors>()!.whiteColor,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => CustomImageBottomSheetPicker(
                              pickImage: (file) {
                                return pickImage(file);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            : image != null
            ? _buildFileImage(context)
            : _buildUploadUI(context),
      ),
    );
  }

  Widget _buildFileImage(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.file(
            image!,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).extension<AppColors>()!.redColor,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Theme.of(context).extension<AppColors>()!.whiteColor,
              ),
              onPressed: removeImage,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadUI(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SvgPicture.asset(Assets.camera),
            const SizedBox(height: 12),
            Text(
              LocaleKeys.add_food_photo.tr(),
              style: AppTextStyle.styleRegular16(context).copyWith(
                color: Theme.of(context).extension<AppColors>()!.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              LocaleKeys.help_recipients_see_donation.tr(),
              style: AppTextStyle.styleRegular14(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200.w,
              child: CustomButton(
                backgroundColor: Theme.of(
                  context,
                ).extension<AppColors>()!.whiteColor,
                borderColor: Theme.of(
                  context,
                ).extension<AppColors>()!.primaryColor,
                title: LocaleKeys.take_photo.tr(),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) =>
                        CustomImageBottomSheetPicker(pickImage: pickImage),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
