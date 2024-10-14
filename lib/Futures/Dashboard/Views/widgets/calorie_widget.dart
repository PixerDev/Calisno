import 'package:flutter/cupertino.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class CalorieWidget extends StatelessWidget {
  const CalorieWidget({
    super.key,
    required this.svgpath,
    required this.title,
    required this.calorie,
  });
  final String svgpath;
  final String title;
  final String calorie;
  @override
  Widget build(BuildContext context) {
    final textTheme = Get.theme.textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.4.w),
      child: Column(
        children: [
          Container(
            width: 7.h,
            height: 7.h,
            padding: EdgeInsets.all(1.h),
            decoration: const BoxDecoration(
                color: AppColors.primaryColor1, shape: BoxShape.circle),
            child: Image.asset(
              svgpath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            title,
            style: textTheme.labelSmall,
          ),
          SizedBox(
            height: 1.h,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              '$calorie کالری',
              style: textTheme.bodySmall?.apply(color: AppColors.blackColor),
            ),
          )
        ],
      ),
    );
  }
}
