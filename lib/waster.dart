import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/routing/router_generation_config.dart';
import 'package:waster/core/themes/theme_controller.dart';
import 'package:waster/core/themes/theme_data.dart';

class WasterApp extends StatelessWidget {
  const WasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeController.instance,
      builder: (context, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: ThemeController.instance.isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          themeAnimationCurve: Curves.elasticInOut,
          themeAnimationDuration: const Duration(milliseconds: 500),
          routerConfig: RouterGenerationConfig.goRoute,
        );
      },
    );
  }
}
