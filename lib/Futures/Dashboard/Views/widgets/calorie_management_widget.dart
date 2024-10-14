import 'package:flutter/cupertino.dart';
import 'package:flutter_sport_app_1/Core/common_widgets/round_gradient_button.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
import 'package:flutter_sport_app_1/gen/assets.gen.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class CalorieManagementWidget extends StatelessWidget {
  const CalorieManagementWidget({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final textTheme = Get.theme.textTheme;

    return Container(
      width: 95.w,
      height: 10.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5.w),
          gradient: LinearGradient(colors: AppColors.secondaryG)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 30.w,
            height: 7.h,
            child: RoundGradientButton(
              onPressed: onTap,
              title: 'مدیریت',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'مدیریت کالری',
                  style: textTheme.bodyLarge,
                ),
                SizedBox(width: 3.w),
                Assets.icons.food.image(width: 9.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
