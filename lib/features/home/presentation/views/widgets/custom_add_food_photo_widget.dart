import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomAddFoodPhotoWidget extends StatelessWidget {
  const CustomAddFoodPhotoWidget({
    super.key,
    required this.pickImage,
    this.removeImage,
    this.image,
  });
  final File? image;
  final Future<void> Function(bool fromCamera) pickImage;
  final void Function()? removeImage;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 20,
      backgroundColor: AppColors.primaryColor.withAlpha(13),
      borderColor: AppColors.primaryColor.withAlpha(51),
      child: image == null
          ? Column(
              children: [
                SvgPicture.asset(Assets.camera),
                const SizedBox(height: 12),
                Text(
                  'Add Food Photo',
                  style: AppTextStyle.styleRegular16(
                    context,
                  ).copyWith(color: AppColors.primaryColor),
                ),
                const SizedBox(height: 8),
                Text(
                  'Help recipients see what you\'re offering',
                  style: AppTextStyle.styleRegular14(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 150,
                  child: CustomButton(
                    backgroundColor: AppColors.whiteColor,
                    borderColor: AppColors.primaryColor,
                    title: 'Take Photo',
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => SafeArea(
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.camera_alt),
                                title: const Text('Take Photo'),
                                onTap: () {
                                  context.pop();
                                  pickImage(true);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo_library),
                                title: const Text('Upload from Gallery'),
                                onTap: () {
                                  context.pop();
                                  pickImage(false);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
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
                    backgroundColor: AppColors.redColor,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: AppColors.whiteColor,
                      ),
                      onPressed: removeImage,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
