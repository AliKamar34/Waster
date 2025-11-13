import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/core/widgets/custom_loading_indicator.dart';
import 'package:waster/features/home/domain/entity/enums/post_mode_enum.dart';
import 'package:waster/features/home/domain/entity/post_entity.dart';
import 'package:waster/features/home/presentation/manager/bloc/post_bloc.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_donate_app_bar.dart';
import 'package:waster/features/home/presentation/views/widgets/donate_form.dart';

class DonateView extends StatelessWidget {
  const DonateView({super.key, required this.postMode, this.post})
    : assert(
        postMode == PostMode.create ||
            (postMode == PostMode.edit && post != null),
        'Post must not be null in edit mode',
      );
  final PostMode postMode;
  final PostEntity? post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostSuccess) {
              showToast(
                context,
                postMode == PostMode.edit
                    ? 'Post updated successfully'
                    : 'Post created successfully',
              );
              context.pop();
            } else if (state is PostFailure) {
              showToast(context, state.message, isError: true);
            }
          },
          builder: (context, state) {
            return CustomLoadinIndicator(
              isLoading: state is PostLoading ? true : false,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 24,
                  children: [
                    const CustomDonateAppBar(),
                    DonateForm(postMode: postMode, post: post),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
