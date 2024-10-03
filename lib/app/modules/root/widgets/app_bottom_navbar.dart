import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';

class AppBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const AppBottomNavbar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: kBottomNavigationBarHeight,
          decoration: const BoxDecoration(
            gradient: AppColors.primaryVariantGradient,
          ),
        ),
        BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: _buildBottomNavBarItems(),
        ),
      ],
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          currentIndex == 0
              ? AppAssets.activeHomeIcon
              : AppAssets.inactiveHomeIcon,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          currentIndex == 1
              ? AppAssets.activeCalendarIcon
              : AppAssets.inactiveCalendarIcon,
        ),
        label: 'Calendar',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          currentIndex == 2
              ? AppAssets.activeAboutIcon
              : AppAssets.inactiveAboutIcon,
        ),
        label: 'About',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          currentIndex == 3
              ? AppAssets.activeChatIcon
              : AppAssets.inactiveChatIcon,
        ),
        label: 'Chat',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          currentIndex == 4
              ? AppAssets.activeProfileIcon
              : AppAssets.inactiveProfileIcon,
        ),
        label: 'Profile',
      ),
    ];
  }
}
