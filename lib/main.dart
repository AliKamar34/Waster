import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/helpers/shared_prefs_helper.dart';
import 'package:waster/core/themes/theme_controller.dart';
import 'package:waster/core/utils/service_locator.dart';
import 'package:waster/waster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await SharedPrefsHelper.init();
  await EasyLocalization.ensureInitialized();
  await ThemeController.instance.loadTheme();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: const WasterApp(),
    ),
  );
}
