import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';
import 'package:waster/features/settings/presentation/views/widgets/contact_info_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_header_card.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_statistics_section.dart';

class CustomProfileLoadingWidget extends StatelessWidget {
  const CustomProfileLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      child: Column(
        spacing: 24,
        children: [
          ProfileHeaderCard(
            user: UserEntity(
              fullName: 'Loading state ...',
              email: 'Loading State Email...',
              address: 'Loading state ...',
              phoneNumber: 'Loading State phoneNumber...',
            ),
          ),
          ProfileStatisticsSection(),
          ContactInfoSection(
            email: 'Loading State Email...',
            phoneNum: 'Loading State phoneNumber...',
          ),
        ],
      ),
    );
  }
}
