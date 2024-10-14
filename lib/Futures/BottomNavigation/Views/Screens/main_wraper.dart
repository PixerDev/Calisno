import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Futures/Ai/Views/screens/ai_screen.dart';
import 'package:flutter_sport_app_1/Futures/BottomNavigation/Models/bottomnav_counter_model.dart';
import 'package:flutter_sport_app_1/Futures/BottomNavigation/Views/Widgets/bottom_nav_bar.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Views/screens/dashboard_screen.dart';
import 'package:flutter_sport_app_1/Futures/Exercise/Controller/category_controller.dart';
import 'package:flutter_sport_app_1/Futures/Exercise/Views/screens/exercise_category_screen.dart';

import 'package:flutter_sport_app_1/Futures/Profile/Views/screens/user_profile.dart';
import 'package:flutter_sport_app_1/Futures/program/Views/screens/select_program_screen.dart';

import 'package:get/get.dart';

class MainWraper extends StatefulWidget {
  const MainWraper({super.key, required this.bottomNavCounterModel});
  final BottomNavCounterModel bottomNavCounterModel;

  @override
  State<MainWraper> createState() => _MainWraperState();
}

class _MainWraperState extends State<MainWraper> {
  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = CategoryController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Obx(() => IndexedStack(
                index: widget.bottomNavCounterModel.selectedTabIndex,
                children: [
                  const UserProfile(),
                  const AiScreen(),
                  const DashboardScreen(),
                  ExerciseCategoryScreen(
                    categories: categoryController.models,
                  ),
                  const SelectProgramScreen()
                ],
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BottomNavBar(
                bottomNavCounterModel: widget.bottomNavCounterModel,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
