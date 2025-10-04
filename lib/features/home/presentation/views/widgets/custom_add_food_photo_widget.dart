import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_container.dart';

class CustomAddFoodPhotoWidget extends StatefulWidget {
  const CustomAddFoodPhotoWidget({super.key});

  @override
  State<CustomAddFoodPhotoWidget> createState() =>
      _CustomAddFoodPhotoWidgetState();
}

class _CustomAddFoodPhotoWidgetState extends State<CustomAddFoodPhotoWidget> {
  File? _image;

  Future<void> _pickImage({required bool fromCamera}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 20,
      backgroundColor: AppColors.primaryColor.withAlpha(13),
      borderColor: AppColors.primaryColor.withAlpha(51),
      child: _image == null
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
                                  _pickImage(fromCamera: true);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo_library),
                                title: const Text('Upload from Gallery'),
                                onTap: () {
                                  context.pop();
                                  _pickImage(fromCamera: false);
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
                    _image!,
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
                      onPressed: _removeImage,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
