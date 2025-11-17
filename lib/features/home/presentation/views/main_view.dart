import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/routing/app_routes.dart';
import 'package:waster/core/themes/app_colors.dart';
import 'package:waster/core/themes/app_text_style.dart';
import 'package:waster/core/utils/service_locator.dart';
import 'package:waster/features/browse/presentation/views/browse_view.dart';
import 'package:waster/features/home/presentation/views/home_view.dart';
import 'package:waster/features/impact/presentation/views/impact_view.dart';
import 'package:waster/features/post/domain/entity/enums/post_mode_enum.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';
import 'package:waster/features/settings/presentation/views/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currIndex = 0;
  late final List<Widget> _pages;
  late final SettingsBloc _settingsBloc;

  @override
  void initState() {
    _settingsBloc = sl<SettingsBloc>()..add(const GetUserDetailsEvent());
    _pages = [
      const HomeView(),
      const BrowseView(),
      const SizedBox.shrink(),
      const ImpactView(),
      BlocProvider.value(value: _settingsBloc, child: const ProfileView()),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _settingsBloc.close();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      context.pushNamed(
        AppRoutes.donateView,
        extra: {'postMode': PostMode.create, 'post': null},
      );
    } else {
      setState(() {
        _currIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currIndex, children: _pages),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  BottomNavigationBar _bottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Theme.of(context).extension<AppColors>()!.whiteColor,
      currentIndex: _currIndex,
      selectedItemColor: Theme.of(context).extension<AppColors>()!.primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppTextStyle.styleMeduim14(context),
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.home,
            colorFilter: ColorFilter.mode(
              _currIndex == 0
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
              _currIndex == 1
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
              _currIndex == 3
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
              _currIndex == 4
                  ? Theme.of(context).extension<AppColors>()!.primaryColor
                  : Theme.of(context).extension<AppColors>()!.blackTextColor,
              BlendMode.srcIn,
            ),
          ),
          label: LocaleKeys.profile.tr(),
        ),
      ],
    );
  }
}
