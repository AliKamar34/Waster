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
import 'package:waster/features/claim/presentation/manager/cubit/claim_cubit.dart';

Future<dynamic> showDeleteDialog(
  BuildContext context,
  String id,
  ClaimCubit bloc,
) {
  return showDialog(
    context: context,
    builder: (_) {
      return BlocProvider.value(
        value: bloc,
        child: BlocConsumer<ClaimCubit, ClaimState>(
          listener: (context, state) {
            if (state is ClaimActionSuccess) {
              showToast(context, LocaleKeys.claim_cancelled_successfully.tr());
              context.read<ClaimCubit>().getUserClaims('');
              context.pop();
            } else if (state is ClaimActionFailure) {
              showToast(context, state.message, isError: true);
            }
          },
          builder: (context, state) => CustomLoadinIndicator(
            isLoading: state is ClaimActionLoading ? true : false,
            child: CustomAlert(
              content: LocaleKeys.cancel_claim_content.tr(),
              title: LocaleKeys.cancel_claim_title.tr(),
              button1: CustomButton(
                title: LocaleKeys.cancle.tr(),
                onPressed: () {
                  context.pop();
                },
              ),
              button2: CustomButton(
                title: LocaleKeys.Delete.tr(),
                onPressed: () {
                  context.read<ClaimCubit>().cancleClaim(id);
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
