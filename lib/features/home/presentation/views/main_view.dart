import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
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
        backgroundColor: AppColors.whiteColor,
        currentIndex: currIndex,
        selectedItemColor: AppColors.primaryColor,
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
                    ? AppColors.primaryColor
                    : AppColors.blackTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.browse,
              colorFilter: ColorFilter.mode(
                currIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.blackTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: AppColors.blackTextColor),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.impact,
              colorFilter: ColorFilter.mode(
                currIndex == 3
                    ? AppColors.primaryColor
                    : AppColors.blackTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Impact',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.profile,
              colorFilter: ColorFilter.mode(
                currIndex == 4
                    ? AppColors.primaryColor
                    : AppColors.blackTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
