import 'package:flutter/material.dart';

import 'package:flutter_sport_app_1/Core/common_widgets/round_gradient_button.dart';

import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/activity_controller.dart';

import 'package:flutter_sport_app_1/Futures/CreateProfile/Views/screens/welcome_screen.dart';
import 'package:flutter_sport_app_1/Futures/CreateProfile/Views/widgets/activity_slide_widget.dart';

import 'package:flutter_sport_app_1/gen/assets.gen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Get.textTheme;
    final ActivityController activityController = ActivityController();
    Map<String, dynamic> dataReceived = Get.arguments;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Text('میزان فعالیت شما؟',
              textAlign: TextAlign.center,
              style: themeData.displayLarge?.apply(fontSizeDelta: -3)),
          SizedBox(height: 1.h),
          Text("این کمک می‌کنه که\n بهترین برنامه رو برای شما انتخاب کنیم",
              textAlign: TextAlign.center, style: themeData.bodySmall),
          SizedBox(height: 1.h),
          SizedBox(
            height: 75.h,
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Obx(
                  () => Column(
                    children: [
                      ActivitySlideWidget(
                        activityLevel: activityController.getActivityLevel,
                        slideActivityLevel: ActivityLevel.sedentary,
                        ontap: () {
                          activityController
                              .setactivity(ActivityLevel.sedentary);
                        },
                        imagePath: Assets.images.goal4.path,
                        title: 'کم‌تحرک',
                        subtitle: 'بدون ورزش یا ورزش خیلی کم',
                      ),
                      ActivitySlideWidget(
                        activityLevel: activityController.getActivityLevel,
                        slideActivityLevel: ActivityLevel.lightlyActive,
                        ontap: () {
                          activityController
                              .setactivity(ActivityLevel.lightlyActive);
                        },
                        imagePath: Assets.images.goal5.path,
                        title: 'کمی فعال',
                        subtitle: 'ورزش سبک/ورزش ۳-۱ روز در هفته',
                      ),
                      ActivitySlideWidget(
                        activityLevel: activityController.getActivityLevel,
                        slideActivityLevel: ActivityLevel.moderatelyActive,
                        ontap: () {
                          activityController
                              .setactivity(ActivityLevel.moderatelyActive);
                        },
                        imagePath: Assets.images.goal3.path,
                        title: 'نسبتاً فعال',
                        subtitle: 'رزش متوسط/ورزش ۵-۳ روز در هفته',
                      ),
                      ActivitySlideWidget(
                        activityLevel: activityController.getActivityLevel,
                        slideActivityLevel: ActivityLevel.veryActive,
                        ontap: () {
                          activityController
                              .setactivity(ActivityLevel.veryActive);
                        },
                        imagePath: Assets.images.goal2.path,
                        title: 'بسیار فعال',
                        subtitle: 'ورزش سنگین/ورزش ۷-۶ روز در هفته',
                      ),
                      ActivitySlideWidget(
                        activityLevel: activityController.getActivityLevel,
                        slideActivityLevel: ActivityLevel.superActive,
                        ontap: () {
                          activityController
                              .setactivity(ActivityLevel.superActive);
                        },
                        imagePath: Assets.images.goal1.path,
                        title: 'فوق‌العاده فعال',
                        subtitle:
                            'ورزش بسیار سنگین/کار فیزیکی سخت \nو ورزش ۲ بار در روز',
                      ),
                    ],
                  ),
                )),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h, left: 2.w, right: 2.w),
            child: RoundGradientButton(
              title: "بزن بریم",
              onPressed: () {
                final dataToSend = {
                  'completeDataReceived': dataReceived,
                  'activity': activityController.getActivityLevel,
                };
                Get.to(const WelcomeScreen(), arguments: dataToSend);
              },
            ),
          )
        ],
      )),
    );
  }
}
