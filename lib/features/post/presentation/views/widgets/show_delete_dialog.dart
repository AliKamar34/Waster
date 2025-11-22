import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/core/widgets/custom_alert.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_loading_indicator.dart';
import 'package:waster/features/post/presentation/manager/bloc/post_bloc.dart';

Future<dynamic> showDeleteDialog(
  BuildContext context,
  String id,
  PostBloc bloc,
) {
  return showDialog(
    context: context,
    builder: (_) {
      return BlocProvider.value(
        value: bloc,
        child: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostSuccess) {
              showToast(context, LocaleKeys.Post_Deleted_Successfully.tr());
              context.pop();
            } else if (state is PostFailure) {
              showToast(context, state.message, isError: true);
            }
          },
          builder: (context, state) => CustomLoadinIndicator(
            isLoading: state is PostLoading ? true : false,
            child: CustomAlert(
              content: LocaleKeys.Are_u_Sure_You_Want_To_Delete_this_post.tr(),
              title: LocaleKeys.Delete_Post.tr(),
              button1: CustomButton(
                title: LocaleKeys.cancle.tr(),
                onPressed: () {
                  context.pop();
                },
              ),
              button2: CustomButton(
                title: LocaleKeys.Delete.tr(),
                onPressed: () {
                  bloc.add(DeletePostEvent(id: id));
                },
                backgroundColor: Theme.of(
                  context,
                ).extension<AppColors>()!.redColor,
              ),
            ),
          ),
        ),
      );
    },
  );
}
