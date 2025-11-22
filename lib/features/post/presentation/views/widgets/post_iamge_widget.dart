import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:waster/core/constants/assets.dart';

class PostIamgeWidget extends StatelessWidget {
  const PostIamgeWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: CachedNetworkImage(
        height: 200.h,
        width: double.infinity,
        fit: BoxFit.cover,
        imageUrl: 'http://waster.runasp.net/$imageUrl',
        placeholder: (context, url) =>
            Skeletonizer(child: Image.asset(Assets.noImage, fit: BoxFit.cover)),
        errorWidget: (context, url, error) =>
            Image.asset(Assets.noImage, fit: BoxFit.cover),
      ),
    );
  }
}
