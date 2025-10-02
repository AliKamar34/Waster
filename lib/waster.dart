import 'package:flutter/material.dart';
import 'package:waster/core/routing/router_generation_config.dart';

class WasterApp extends StatelessWidget {
  const WasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouterGenerationConfig.goRoute,
    );
  }
}
