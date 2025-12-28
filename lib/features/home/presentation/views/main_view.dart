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
import 'package:waster/features/browse/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:waster/features/browse/presentation/views/browse_view.dart';
import 'package:waster/features/home/presentation/manager/feed_cubit/feed_cubit.dart';
import 'package:waster/features/home/presentation/views/home_view.dart';
import 'package:waster/features/impact/presentation/views/impact_view.dart';
import 'package:waster/features/post/domain/entity/enums/post_mode_enum.dart';
import 'package:waster/features/post/presentation/manager/book_mark_cubit/book_mark_cubit.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';
import 'package:waster/features/settings/presentation/views/profile_view.dart';
import 'dart:ui';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currIndex = 0;
  late final List<Widget> _pages;
  late final SettingsBloc _settingsBloc;
  late final CategoriesCubit _categoriesCubit;
  late final FeedPostsCubit _feedPostsCubit;
  late final BookmarkCubit _bookmarkCubit;

  @override
  void initState() {
    _settingsBloc = sl<SettingsBloc>()..add(const GetUserDetailsEvent());
    _categoriesCubit = sl<CategoriesCubit>()..loadCategories();
    _feedPostsCubit = sl<FeedPostsCubit>();
    _bookmarkCubit = sl<BookmarkCubit>()..loadBookmarks();

    _pages = [
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _categoriesCubit),
          BlocProvider.value(value: _feedPostsCubit),
          BlocProvider.value(value: _bookmarkCubit),
        ],
        child: const HomeView(),
      ),
      BlocProvider.value(value: _bookmarkCubit, child: const BrowseView()),
      const SizedBox.shrink(),
      const ImpactView(),
      BlocProvider.value(value: _settingsBloc, child: const ProfileView()),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _settingsBloc.close();
    _categoriesCubit.close();
    _feedPostsCubit.close();
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
      body: Stack(
        children: [
          IndexedStack(index: _currIndex, children: _pages),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _bottomNavBar(context),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).extension<AppColors>()!.blackTextColor.withAlpha(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 2),
                _navItem(
                  index: 0,
                  icon: Assets.home,
                  label: LocaleKeys.home.tr(),
                ),
                _navItem(
                  index: 1,
                  icon: Assets.browse,
                  label: LocaleKeys.browse.tr(),
                ),
                _addButton(),
                _navItem(
                  index: 3,
                  icon: Assets.impact,
                  label: LocaleKeys.impact.tr(),
                ),
                _navItem(
                  index: 4,
                  icon: Assets.profile,
                  label: LocaleKeys.profile.tr(),
                ),
                const SizedBox(width: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required int index,
    required String icon,
    required String label,
  }) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final isSelected = _currIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: AnimatedContainer(
          curve: Curves.easeOutCubic,
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected
                ? colors.primaryColor.withAlpha(40)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  isSelected ? colors.primaryColor : colors.blackTextColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: AppTextStyle.styleMeduim14(context).copyWith(
                  color: isSelected
                      ? colors.primaryColor
                      : colors.blackTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addButton() {
    final colors = Theme.of(context).extension<AppColors>()!;

    return GestureDetector(
      onTap: () => _onItemTapped(2),
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors.primaryColor.withAlpha(229),
          boxShadow: [
            BoxShadow(
              color: colors.primaryColor.withAlpha(102),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

//   BottomNavigationBar _bottomNavBar(BuildContext context) {
//     return BottomNavigationBar(
//       elevation: 0,
//       backgroundColor: Theme.of(context).extension<AppColors>()!.whiteColor,
//       currentIndex: _currIndex,
//       selectedItemColor: Theme.of(context).extension<AppColors>()!.primaryColor,
//       type: BottomNavigationBarType.fixed,
//       selectedLabelStyle: AppTextStyle.styleMeduim14(context),
//       onTap: _onItemTapped,
//       items: [
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             Assets.home,
//             colorFilter: ColorFilter.mode(
//               _currIndex == 0
//                   ? Theme.of(context).extension<AppColors>()!.primaryColor
//                   : Theme.of(context).extension<AppColors>()!.blackTextColor,
//               BlendMode.srcIn,
//             ),
//           ),
//           label: LocaleKeys.home.tr(),
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             Assets.browse,
//             colorFilter: ColorFilter.mode(
//               _currIndex == 1
//                   ? Theme.of(context).extension<AppColors>()!.primaryColor
//                   : Theme.of(context).extension<AppColors>()!.blackTextColor,
//               BlendMode.srcIn,
//             ),
//           ),
//           label: LocaleKeys.browse.tr(),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.add,
//             color: Theme.of(context).extension<AppColors>()!.blackTextColor,
//           ),
//           label: LocaleKeys.donate.tr(),
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             Assets.impact,
//             colorFilter: ColorFilter.mode(
//               _currIndex == 3
//                   ? Theme.of(context).extension<AppColors>()!.primaryColor
//                   : Theme.of(context).extension<AppColors>()!.blackTextColor,
//               BlendMode.srcIn,
//             ),
//           ),
//           label: LocaleKeys.impact.tr(),
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             Assets.profile,
//             colorFilter: ColorFilter.mode(
//               _currIndex == 4
//                   ? Theme.of(context).extension<AppColors>()!.primaryColor
//                   : Theme.of(context).extension<AppColors>()!.blackTextColor,
//               BlendMode.srcIn,
//             ),
//           ),
//           label: LocaleKeys.profile.tr(),
//         ),
//       ],
//     );
//   }
// }
