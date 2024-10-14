import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Core/Models/activity_level_adapter.dart';
import 'package:flutter_sport_app_1/Core/Models/gender_adapter.dart';
import 'package:flutter_sport_app_1/Core/Models/user_model.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
import 'package:flutter_sport_app_1/Futures/Ai/Models/chat_model.dart';
import 'package:flutter_sport_app_1/Futures/BottomNavigation/Controllers/bottom_nav_counter_controller.dart';
import 'package:flutter_sport_app_1/Futures/BottomNavigation/Views/Screens/main_wraper.dart';
import 'package:flutter_sport_app_1/Futures/OnBorading/Views/screens/start_screen.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();

//onboarding pag
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('seenOnboarding') ?? true;

  await Hive.initFlutter(appDocumentDir.path);

  // Register the adapter
  Hive.registerAdapter(GenderAdapter());
  Hive.registerAdapter(ActivityLevelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('userBox');

  //ai
  Hive.registerAdapter(ChatMessageAdapter());
  await Hive.openBox('chatBox');
  await Hive.openBox<int>('waterBox');
  runApp(MyApp(
    seenOnboarding: seenOnboarding,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.seenOnboarding});
  final bool seenOnboarding;
  //root of application.
  @override
  Widget build(BuildContext context) {
    BottomNavCounterController bottomNavCounterController =
        BottomNavCounterController();
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.lightGrayColor, elevation: 1),
            textTheme: TextTheme(
                displayLarge: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.blackColor,
                  fontSize: 19.sp,
                ),
                displayMedium: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.grayColor,
                  wordSpacing: 1.sp,
                  fontSize: 12.5.sp,
                ),
                labelLarge: const TextStyle(
                  fontSize: 17,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w900,
                ),
                bodyLarge: const TextStyle(
                  fontSize: 13,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w900,
                ),
                labelSmall: TextStyle(
                    fontSize: 9.sp,
                    color: AppColors.grayColor,
                    fontWeight: FontWeight.w700),
                bodySmall: TextStyle(
                  color: AppColors.grayColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 10.sp,
                )),
            primaryColor: AppColors.primaryColor1,
            useMaterial3: true,
            fontFamily: "Vazir"),
        home: seenOnboarding
            ? const StartScreen()
            : MainWraper(
                bottomNavCounterModel: bottomNavCounterController.model),
      ),
    );
  }
}
