import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/utils/service_locator.dart';
import 'package:waster/features/browse/presentation/manager/expiring_soon_cubit/expiring_soon_cubit.dart';
import 'package:waster/features/browse/presentation/views/widgets/expires_soon_list_view.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_browse_app_bar.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBrowseAppBar(),
          Text(
            LocaleKeys.expires_soon.tr(),
            style: AppTextStyle.styleRegular18(context),
          ),
          BlocProvider(
            create: (context) => sl<ExpiringSoonCubit>(),
            child: const Expanded(child: ExpiresSoonListView()),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
