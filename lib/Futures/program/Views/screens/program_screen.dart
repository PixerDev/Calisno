import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
import 'package:flutter_sport_app_1/Futures/program/Model/program_model.dart';

import 'package:flutter_sport_app_1/gen/assets.gen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProgramScreen extends StatelessWidget {
  const ProgramScreen({super.key, required this.title, required this.programs});

  final String title;
  final List<List<ProgramModel>> programs;
  @override
  Widget build(BuildContext context) {
    final textTheme = Get.theme.textTheme;
    List week = ['هفته اول', 'هفته دوم', 'هفته سوم', 'هفته جهارم'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: textTheme.displayLarge?.apply(fontSizeDelta: -3),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 100.w,
            height: 89.h,
            child: ListView.builder(
              itemCount: programs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      AppColors.midGrayColor.withOpacity(0.5),
                                  blurRadius: 2,
                                  offset: const Offset(0, 4)),
                            ],
                            borderRadius: BorderRadius.circular(4.w)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 3.h,
                            ),
                            SizedBox(
                              width: 100.w,
                              height: 20.h,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: programs[index].length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        programs[0][index].name,
                                        style: textTheme.bodyLarge
                                            ?.apply(color: AppColors.grayColor),
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Assets.icons.barbell
                                            .image(width: 7.w, height: 7.w),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 100.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.w),
                                topRight: Radius.circular(4.w)),
                            gradient:
                                LinearGradient(colors: AppColors.secondaryG)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            week[index],
                            textAlign: TextAlign.right,
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
