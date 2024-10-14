import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';

import 'package:flutter_sport_app_1/Futures/Exercise/Models/video_model.dart';
import 'package:flutter_sport_app_1/Futures/Exercise/Views/screens/play_video_screen.dart';
import 'package:flutter_sport_app_1/gen/assets.gen.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({
    super.key,
    required this.appBarTitle,
    required this.videos,
  });
  final String appBarTitle;
  final List<VideoModel> videos;

  @override
  Widget build(BuildContext context) {
    final themeData = Get.textTheme;
    return Scaffold(
        backgroundColor: AppColors.lightGrayColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          foregroundColor: AppColors.primaryColor1,
          title: Text(
            appBarTitle,
            style: themeData.labelLarge?.apply(color: AppColors.blackColor),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: 100.w,
          height: 99.h,
          child: ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 1.h, left: 3.w, right: 3.w),
                child: ExserciseWidget(
                  title: videos[index].title,
                  videoUrl: videos[index].videoPath,
                ),
              );
            },
          ),
        ));
  }
}

class ExserciseWidget extends StatelessWidget {
  const ExserciseWidget({
    super.key,
    required this.videoUrl,
    required this.title,
  });

  final String videoUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    final themeData = Get.textTheme;
    return GestureDetector(
      onTap: () {
        Get.to(PlayVideoScreen(
          title: title,
          videourl: videoUrl,
        ));
      },
      child: Container(
        height: 10.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            gradient: LinearGradient(colors: AppColors.primaryG),
            boxShadow: [
              BoxShadow(
                  color: AppColors.midGrayColor.withOpacity(0.5),
                  blurRadius: 5,
                  offset: const Offset(0, 4))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 5.w,
              ),
              child: Assets.icons.backIcon.image(),
            ),
            Padding(
              padding: EdgeInsets.all(2.h),
              child: Row(
                children: [
                  Text(
                    title,
                    style: themeData.bodyLarge?.apply(fontSizeDelta: 2),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Assets.icons.barbell.image(height: 5.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
