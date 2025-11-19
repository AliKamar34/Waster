import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/themes/app_colors.dart';

class CustomLoadinIndicator extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const CustomLoadinIndicator({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          child,

          if (isLoading)
            Positioned.fill(
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(color: Colors.black.withAlpha(20)),
                  ),

                  Center(
                    child: Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).extension<AppColors>()!.whiteColor,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: CircularProgressIndicator(
                        color: Theme.of(
                          context,
                        ).extension<AppColors>()!.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
