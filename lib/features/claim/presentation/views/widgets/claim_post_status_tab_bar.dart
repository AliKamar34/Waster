import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_tab_bar_button.dart';
import 'package:waster/features/claim/presentation/manager/cubit/claim_cubit.dart';

class ClaimPostStatusTabBar extends StatefulWidget {
  const ClaimPostStatusTabBar({super.key});

  @override
  State<ClaimPostStatusTabBar> createState() => _ClaimPostStatusTabBarState();
}

class _ClaimPostStatusTabBarState extends State<ClaimPostStatusTabBar> {
  int currIndex = 0;

  List<String> statusList = ['All', 'Pending', 'Approved', 'Rejected'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: statusList.length,
        itemBuilder: (context, index) {
          final isSelected = currIndex == index;
          final status = statusList[index];
          return CustomTabBarButton(
            title: status,
            textColor: isSelected
                ? Theme.of(context).extension<AppColors>()!.whiteColor
                : Theme.of(context).extension<AppColors>()!.blackTextColor,
            color: isSelected
                ? Theme.of(context).extension<AppColors>()!.primaryColor
                : Theme.of(context).extension<AppColors>()!.scaffoldColor,
            onPressed: () {
              setState(() {
                currIndex = index;
              });
              final selectedStatus = index == 0 ? '' : status;
              context.read<ClaimCubit>().getUserClaims(selectedStatus);
            },
          );
        },
      ),
    );
  }
}
