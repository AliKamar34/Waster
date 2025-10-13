import 'package:flutter/material.dart';
import 'package:waster/core/helpers/shared_prefs_helper.dart';
import 'package:waster/core/themes/theme_controller.dart';
import 'package:waster/waster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  await ThemeController.instance.loadTheme();
  runApp(const WasterApp());
}
