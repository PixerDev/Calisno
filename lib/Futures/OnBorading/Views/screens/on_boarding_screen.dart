import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';

import 'package:flutter_sport_app_1/Futures/CreateProfile/Views/screens/register_screen.dart';
import 'package:flutter_sport_app_1/Futures/OnBorading/Views/widgets/pager_widget.dart';
import 'package:flutter_sport_app_1/gen/assets.gen.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  static String routeName = "/OnBoardingScreen";
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  List pageList = [
    {
      "title": "هدف هاتو دنبال کن",
      "subtitle":
          "نگران نباش اگه تو تعیین اهدافت مشکلی داری. ما اینجاییم که کمکت کنیم اهدافت رو تعیین کنی و دنبالشون کنی.",
      "image": Assets.images.onBoard1
    },
    {
      "title": "بسوزون!",
      "subtitle":
          "بیا بسوزونیم تا به اهدافت برسیم. دردش موقتیه، اما اگه الان تسلیم بشی، تا ابد دردت باقی می‌مونه.",
      "image": Assets.images.onBoard2
    },
    {
      "title": "خوب بخور",
      "subtitle":
          "بیا با هم یه سبک زندگی سالم شروع کنیم. می‌تونیم هر روز رژیم غذاییت رو تعیین کنیم .",
      "image": Assets.images.onBoard3
    },
    {
      "title": "بهبود کیفیت خواب",
      "subtitle":
          "با ما کیفیت خوابت رو بهتر کن. خواب باکیفیت می‌تونه صبح‌ها حالت رو خوب کنه.",
      "image": Assets.images.onBoard4
    }
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: pageList.length,
              onPageChanged: (i) {
                setState(() {
                  selectedIndex = i;
                });
              },
              itemBuilder: (context, index) {
                var temp = pageList[index] as Map? ?? {};
                return PagerWidget(obj: temp);
              },
            ),
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor1,
                      value: (selectedIndex + 1) / 4,
                      strokeWidth: 3,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: AppColors.primaryColor1),
                    child: IconButton(
                      icon: const Icon(
                        Icons.navigate_next,
                        color: AppColors.whiteColor,
                      ),
                      onPressed: () {
                        if (selectedIndex < 3) {
                          selectedIndex = selectedIndex + 1;
                          pageController.animateToPage(selectedIndex,
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.easeInSine);
                        } else {
                          Get.off(const RegisterScreen());
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
