import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/features/browse/presentation/views/browse_view.dart';
import 'package:waster/features/home/presentation/views/home_view.dart';
import 'package:waster/features/impact/presentation/views/impact_view.dart';
import 'package:waster/features/settings/presentation/views/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currIndex = 0;
  final List<Widget> pages = [
    const HomeView(),
    const BrowseView(),
    const SizedBox.shrink(),
    const ImpactView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Theme.of(context).extension<AppColors>()!.whiteColor,
        currentIndex: currIndex,
        selectedItemColor: Theme.of(
          context,
        ).extension<AppColors>()!.primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyle.styleMeduim14(context),
        onTap: (value) {
          if (value == 2) {
            context.pushNamed(AppRoutes.donateView);
          } else {
            setState(() {
              currIndex = value;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.home,
              colorFilter: ColorFilter.mode(
                currIndex == 0
                    ? Theme.of(context).extension<AppColors>()!.primaryColor
                    : Theme.of(context).extension<AppColors>()!.blackTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.home.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.browse,
              colorFilter: ColorFilter.mode(
                currIndex == 1
                    ? Theme.of(context).extension<AppColors>()!.primaryColor
                    : Theme.of(context).extension<AppColors>()!.blackTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.browse.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).extension<AppColors>()!.blackTextColor,
            ),
            label: LocaleKeys.donate.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.impact,
              colorFilter: ColorFilter.mode(
                currIndex == 3
                    ? Theme.of(context).extension<AppColors>()!.primaryColor
                    : Theme.of(context).extension<AppColors>()!.blackTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.impact.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.profile,
              colorFilter: ColorFilter.mode(
                currIndex == 4
                    ? Theme.of(context).extension<AppColors>()!.primaryColor
                    : Theme.of(context).extension<AppColors>()!.blackTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.profile.tr(),
          ),
        ],
      ),
    );
  }
}
