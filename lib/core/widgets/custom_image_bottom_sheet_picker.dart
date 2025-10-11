import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    );
  }
}
