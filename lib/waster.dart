import 'package:flutter/material.dart';
import 'package:waster/features/start/views/splash_view.dart';

class WasterApp extends StatelessWidget {
  const WasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
