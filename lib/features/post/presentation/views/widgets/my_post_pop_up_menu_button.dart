import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/utils/service_locator.dart';
import 'package:waster/features/post/domain/entity/enums/post_mode_enum.dart';
import 'package:waster/features/post/presentation/manager/bloc/post_bloc.dart';
import 'package:waster/features/post/presentation/views/widgets/show_delete_dialog.dart';

class MyPostPopUpMenuButton extends StatelessWidget {
  const MyPostPopUpMenuButton({super.key, required this.postEntity});
  final PostEntity postEntity;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_horiz),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            context.pushNamed(
              AppRoutes.donateView,
              extra: {'postMode': PostMode.edit, 'post': postEntity},
            );
          },
          value: 'Edit',
          child: Text(LocaleKeys.Edit.tr()),
        ),
        PopupMenuItem(
          onTap: () {
            final bloc = sl<PostBloc>();
            showDeleteDialog(context, postEntity.id, bloc);
          },
          value: 'Delete',
          child: Text(LocaleKeys.Delete.tr()),
        ),
      ],
    );
  }
}
