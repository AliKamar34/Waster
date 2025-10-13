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
      builder: (context, _) => MaterialApp.router(
        key: ValueKey(ThemeController.instance.isDark),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: ThemeController.instance.isDark
            ? ThemeMode.dark
            : ThemeMode.light,
        routerConfig: RouterGenerationConfig.goRoute,
      ),
    );
  }
}
