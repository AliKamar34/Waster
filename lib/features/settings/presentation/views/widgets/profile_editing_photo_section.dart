import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/widgets/custom_container.dart';
import 'package:waster/core/widgets/custom_image_bottom_sheet_picker.dart';
import 'package:waster/core/widgets/custom_light_color_container.dart';

class ProfileEditingPhotoSection extends StatefulWidget {
  const ProfileEditingPhotoSection({super.key, required this.name});
  final String name;
  @override
  State<ProfileEditingPhotoSection> createState() =>
      _ProfileEditingPhotoSectionState();
}

class _ProfileEditingPhotoSectionState
    extends State<ProfileEditingPhotoSection> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: 24,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: 16,
          children: [
            Stack(
              children: [
                image == null
                    ? CustomLightColorContainer(
                        color: Theme.of(
                          context,
                        ).extension<AppColors>()!.primaryColor,
                        child: SvgPicture.asset(
                          Assets.profile,
                          width: 50,
                          colorFilter: ColorFilter.mode(
                            Theme.of(
                              context,
                            ).extension<AppColors>()!.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          image!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => CustomImageBottomSheetPicker(
                          pickImage: (bool fromCamera) async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? pickedFile = await picker.pickImage(
                              source: fromCamera
                                  ? ImageSource.camera
                                  : ImageSource.gallery,
                            );
                            if (pickedFile != null) {
                              setState(() {
                                image = File(pickedFile.path);
                              });
                            }
                          },
                        ),
                      );
                    },
                    child: CustomContainer(
                      padding: 4,
                      child: SvgPicture.asset(Assets.camera, width: 20),
                    ),
                  ),
                ),
              ],
            ),
            Text(widget.name, style: AppTextStyle.styleRegular16(context)),
            Text(
              LocaleKeys.donor.tr(),
              style: AppTextStyle.styleRegular14(context),
            ),
          ],
        ),
      ),
    );
  }
}
