import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/features/post/presentation/manager/book_mark_cubit/book_mark_cubit.dart';

class SavePostAction extends StatefulWidget {
  const SavePostAction({
    super.key,
    required this.postId,
    required this.initialIsBookmarked,
  });

  final String postId;
  final bool initialIsBookmarked;

  @override
  State<SavePostAction> createState() => _SavePostActionState();
}

class _SavePostActionState extends State<SavePostAction> {
  late bool _isBookmarked;

  @override
  void initState() {
    super.initState();
    _isBookmarked = context.read<BookmarkCubit>().isBookmarked(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkCubit, BookmarkState>(
      builder: (context, state) {
        if (state is BookmarkToggled && state.postId == widget.postId) {
          _isBookmarked = state.isNowBookmarked;
        }
        final isToggling =
            state is BookmarkToggling && state.postId == widget.postId;
        return InkWell(
          onTap: isToggling
              ? null
              : () {
                  context.read<BookmarkCubit>().toggleBookmark(
                    widget.postId,
                    _isBookmarked,
                  );
                },
          child: isToggling
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).extension<AppColors>()!.blueColor,
                  ),
                )
              : Icon(
                  _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: _isBookmarked
                      ? Theme.of(context).extension<AppColors>()!.blueColor
                      : Theme.of(context).extension<AppColors>()!.orangeColor,
                ),
        );
      },
    );
  }
}
