import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';

class SavePostAction extends StatefulWidget {
  const SavePostAction({super.key, required this.isBookmarked});
  final bool isBookmarked;
  @override
  State<SavePostAction> createState() => _SavePostActionState();
}

class _SavePostActionState extends State<SavePostAction> {
  late bool _isBookmarked;

  @override
  void initState() {
    _isBookmarked = widget.isBookmarked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isBookmarked = !_isBookmarked;
        });
      },
      child: _isBookmarked
          ? Icon(
              Icons.bookmark_outlined,
              color: Theme.of(context).extension<AppColors>()!.blueColor,
            )
          : Icon(
              Icons.bookmark_border,
              color: Theme.of(context).extension<AppColors>()!.orangeColor,
            ),
    );
  }
}
