import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:waster/core/constants/app_constant.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/utils/secure_storage_helper.dart';
import 'package:waster/core/utils/service_locator.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      sl<SecureStorageHelper>().readToken(AppConstant.tokenKey).then((value) {
        if (mounted) {
          if (value != null && value.isNotEmpty) {
            context.pushReplacement(AppRoutes.mainView);
          } else {
            context.pushReplacementNamed(AppRoutes.start);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: LottieBuilder.asset(Assets.lottieSplash)),
    );
  }
}
