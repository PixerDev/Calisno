import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';

import 'package:flutter_sport_app_1/Futures/BottomNavigation/Models/bottomnav_counter_model.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.bottomNavCounterModel,
  });

  final BottomNavCounterModel bottomNavCounterModel;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            width: maxWidth,
            height: 8.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.midGrayColor.withOpacity(0.3),
                    blurRadius: 7,
                  )
                ],
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(27),
                    topRight: Radius.circular(27))),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            NavBarTabWidget(
              icon: Icons.person,
              bottomNavCounterModel: bottomNavCounterModel,
              tabIndex: 0,
            ),
            NavBarTabWidget(
              icon: Icons.chat,
              bottomNavCounterModel: bottomNavCounterModel,
              tabIndex: 1,
            ),
            NavBarTabWidget(
              icon: Icons.restaurant,
              bottomNavCounterModel: bottomNavCounterModel,
              tabIndex: 2,
            ),
            NavBarTabWidget(
              icon: Icons.subscriptions,
              bottomNavCounterModel: bottomNavCounterModel,
              tabIndex: 3,
            ),
            NavBarTabWidget(
              icon: Icons.fitness_center,
              bottomNavCounterModel: bottomNavCounterModel,
              tabIndex: 4,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}

class NavBarTabWidget extends StatelessWidget {
  const NavBarTabWidget({
    super.key,
    required this.bottomNavCounterModel,
    required this.tabIndex,
    required this.icon,
  });
  final IconData icon;
  final int tabIndex;

  final BottomNavCounterModel bottomNavCounterModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      bottomNavCounterModel.setTabIndex(tabIndex);
    }, child: Obx(() {
      return Container(
          margin: EdgeInsets.only(
              bottom:
                  bottomNavCounterModel.selectedTabIndex == tabIndex ? 12 : 0),
          width: 68,
          height: 68,
          decoration: BoxDecoration(
              gradient: bottomNavCounterModel.selectedTabIndex == tabIndex
                  ? LinearGradient(
                      colors: AppColors.primaryG,
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight)
                  : null,
              shape: BoxShape.circle),
          child: Padding(
            padding: EdgeInsets.only(
              bottom:
                  bottomNavCounterModel.selectedTabIndex == tabIndex ? 0 : 5,
            ),
            child: Icon(
              icon,
              size:
                  bottomNavCounterModel.selectedTabIndex == tabIndex ? 35 : 25,
              color: bottomNavCounterModel.selectedTabIndex == tabIndex
                  ? AppColors.blackColor
                  : AppColors.grayColor,
            ),
          ));
    }));
  }
}
