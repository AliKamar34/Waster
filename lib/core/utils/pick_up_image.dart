import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File> pickUpImage(bool fromCamera) async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(
    source: fromCamera ? ImageSource.camera : ImageSource.gallery,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
    // setState(() {
    //   _image =
    // });
  } else {
    throw Exception('No Image Selected');
  }
}
