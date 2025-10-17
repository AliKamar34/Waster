import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';

class CustomImageBottomSheetPicker extends StatelessWidget {
  const CustomImageBottomSheetPicker({super.key, required this.pickImage});

  final Future<void> Function(bool fromCamera) pickImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text(LocaleKeys.take_photo.tr()),
            onTap: () {
              context.pop();
              pickImage(true);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text(LocaleKeys.upload_from_gallery.tr()),
            onTap: () {
              context.pop();
              pickImage(false);
            },
          ),
        ],
      ),
    );
  }
}
