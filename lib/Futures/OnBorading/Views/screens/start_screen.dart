import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
import 'package:flutter_sport_app_1/Futures/OnBorading/Views/screens/on_boarding_screen.dart';

class StartScreen extends StatelessWidget {
  static String routeName = "/StartScreen";

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: media.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [AppColors.primaryColor1, AppColors.primaryColor2],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'کلیسینو',
              style: TextStyle(
                fontSize: 36,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              "همه میتوانند",
              style: TextStyle(
                color: Color(0xff7b6f72),
                fontSize: 18,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnBoardingScreen(),
                      ));
                },
                color: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                textColor: AppColors.primaryColor1,
                child: const Text(
                  "بزن بریم",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
