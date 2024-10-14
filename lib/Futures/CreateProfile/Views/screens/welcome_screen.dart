import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Core/Controller/user_controller.dart';
import 'package:flutter_sport_app_1/Core/Models/user_model.dart';
import 'package:flutter_sport_app_1/Core/common_widgets/round_gradient_button.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
import 'package:flutter_sport_app_1/Futures/BottomNavigation/Controllers/bottom_nav_counter_controller.dart';
import 'package:flutter_sport_app_1/Futures/BottomNavigation/Views/Screens/main_wraper.dart';
import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/activity_controller.dart';
import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/gender_controller.dart';

import 'package:flutter_sport_app_1/gen/assets.gen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Get.textTheme;
    Map<String, dynamic> dataReceived = Get.arguments;
    BottomNavCounterController bottomNavCounterController =
        BottomNavCounterController();
    Map<String, dynamic> completeData = dataReceived['completeDataReceived'];
    Map<String, dynamic> registerData = completeData['registerDataReceived'];
    int age = completeData['age'];
    double weight = completeData['weight'].toDouble();
    double height = completeData['height'].toDouble();
    String name = registerData['name'];
    Gender gender = registerData['gender'];
    ActivityLevel activityLevel = dataReceived['activity'];
    final UserController userController = Get.put(UserController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Assets.images.welcomePromo
                  .image(width: 75.w, fit: BoxFit.fitWidth),
              SizedBox(height: 2.h),
              Text(
                '$name سلام',
                style: const TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 1.h),
              Text(' آماده‌ای! بیا با هم به اهدافت برسیم',
                  textAlign: TextAlign.center, style: themeData.bodySmall),
              const Spacer(),
              RoundGradientButton(
                title: 'بزن بریم',
                onPressed: () {
                  UserModel newUser = UserModel(
                      age: age,
                      weight: weight,
                      height: height,
                      name: name,
                      gender: gender,
                      activityLevel: activityLevel,
                      profileComplete: false);

                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setBool('seenOnboarding', false);
                  });
                  userController.saveUser(newUser);
                  Get.offAll(MainWraper(
                      bottomNavCounterModel: bottomNavCounterController.model));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
