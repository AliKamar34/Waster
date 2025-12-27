import 'package:flutter/material.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/widgets/custom_button.dart';

class ApproveAndRejectPostActions extends StatelessWidget {
  const ApproveAndRejectPostActions({
    super.key,
    required this.onApprove,
    required this.onReject,
  });
  final void Function() onApprove;
  final void Function() onReject;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          flex: 11,
          child: CustomButton(
            backgroundColor: Theme.of(
              context,
            ).extension<AppColors>()!.primaryColor,
            title: 'Approve',
            onPressed: onApprove,
          ),
        ),
        Expanded(
          flex: 10,
          child: CustomButton(
            backgroundColor: Theme.of(context).extension<AppColors>()!.redColor,
            title: 'Reject',
            onPressed: onReject,
          ),
        ),
      ],
    );
  }
}
