import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/features/impact/presentation/manager/cubit/impact_cubit.dart';
import 'package:waster/features/impact/presentation/views/widgets/custom_claim_info_cards.dart';
import 'package:waster/features/impact/presentation/views/widgets/custom_impact_app_bar.dart';
import 'package:waster/features/impact/presentation/views/widgets/custom_impact_loading_widget.dart';
import 'package:waster/features/impact/presentation/views/widgets/main_impact_grid_view.dart';
import 'package:waster/features/impact/presentation/views/widgets/monthly_goals_section.dart';

class ImpactView extends StatelessWidget {
  const ImpactView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: BlocBuilder<ImpactCubit, ImpactState>(
          builder: (context, state) {
            if (state is ImpactLoading) {
              return const CustomImpactLoadingWidget();
            } else if (state is ImpactFailure) {
              return Center(
                child: Text(
                  'Error: ${state.errorMessage}',
                  style: TextStyle(fontSize: 16.sp, color: Colors.red),
                ),
              );
            } else if (state is ImpactSuccess) {
              return SingleChildScrollView(
                child: Column(
                  spacing: 24,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomImpactAppBar(),
                    CustomImpactRow(
                      totalDonationsCount: state.impactEntity.totalDonations
                          .toString(),
                      mealsServedCount: state.impactEntity.totalDonations
                          .toString(),
                    ),
                    CustomClaimInfoCards(
                      availablePosts: state.impactEntity.availablePosts,
                      totalClaims: state.impactEntity.totalClaims,
                      pendingClaims: state.impactEntity.pendingClaims,
                    ),
                    MonthlyGoalsSection(
                      current: state.impactEntity.totalDonations,
                    ),
                    const SizedBox(height: 70),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  'Error: there was an unexpected issue. Please try again later.',
                  style: TextStyle(fontSize: 16.sp, color: Colors.red),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
