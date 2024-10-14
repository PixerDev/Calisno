import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
import 'package:flutter_sport_app_1/Futures/Exercise/Controller/video_controller.dart';

import 'package:flutter_sport_app_1/Futures/Exercise/Views/screens/exercise_screen.dart';
import 'package:flutter_sport_app_1/gen/assets.gen.dart';

import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class ExerciseCategoryWidget extends StatelessWidget {
  const ExerciseCategoryWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.type,
  });
  final String imagePath;
  final String title;
  final int type;

  @override
  Widget build(BuildContext context) {
    final VideoController videoController = VideoController();
    final themeData = Get.textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 3.w),
      child: GestureDetector(
        onTap: () {
          Get.to(ExerciseScreen(
            videos: videoController.models[type],
            appBarTitle: title,
          ));
        },
        child: Container(
            height: 20.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.5.w),
            ),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.5.w),
              child: Stack(
                children: [
                  Image.asset(
                    imagePath,
                    width: 100.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                  Assets.icons.bgDots.image(),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor1,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(4.w))),
                      width: 35.w,
                      height: 5.h,
                      child: Center(
                        child: Text(
                          title,
                          style: themeData.labelLarge,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
