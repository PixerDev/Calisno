import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';

import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class ProgramSlideWidget extends StatelessWidget {
  const ProgramSlideWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.ontap,
  });
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    final themeData = Get.textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 3.w),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
                colors: AppColors.primaryG,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 10.h,
                height: 12.h,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 1.h),
                    Text(title,
                        textAlign: TextAlign.center,
                        style: themeData.labelLarge?.apply(
                            color: AppColors.whiteColor, fontSizeDelta: -1)),
                    SizedBox(height: 1.h),
                    Container(
                      width: 50,
                      height: 1,
                      color: AppColors.lightGrayColor,
                    ),
                    SizedBox(height: 1.h),
                    Text(subtitle,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                        style: themeData.bodySmall
                            ?.apply(color: AppColors.whiteColor)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
