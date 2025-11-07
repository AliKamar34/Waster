import 'package:flutter/material.dart';
import 'dart:ui';

void showBlurBottomSheet(
  BuildContext context,
  Widget Function(BuildContext bottomContext) builder,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (bottomContext) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: builder(bottomContext),
          ),
        ),
      );
    },
  );
}
