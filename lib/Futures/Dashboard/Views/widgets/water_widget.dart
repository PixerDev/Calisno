import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
import 'package:flutter_sport_app_1/gen/assets.gen.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class WaterWidget extends StatelessWidget {
  const WaterWidget({
    super.key,
    required this.waterCount,
    required this.removeTap,
    required this.addTap,
  });
  final RxInt waterCount;
  final VoidCallback removeTap;
  final VoidCallback addTap;
  @override
  Widget build(BuildContext context) {
    final textTheme = Get.theme.textTheme;
    return Container(
      width: 95.w,
      height: 10.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5.w),
          gradient: LinearGradient(colors: AppColors.primaryG)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightGrayColor.withOpacity(0.5)),
                    child: IconButton(
                        onPressed: removeTap,
                        icon: const Icon(Icons.remove,
                            color: AppColors.grayColor))),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => Text(
                        waterCount.value.toString(),
                        style: textTheme.labelLarge,
                      ),
                    )),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightGrayColor.withOpacity(0.5)),
                    child: IconButton(
                        onPressed: addTap,
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.grayColor,
                        )))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  ('(8لیوان)'),
                  textDirection: TextDirection.rtl,
                  style: textTheme.bodyLarge?.apply(fontSizeDelta: -2),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  'آب',
                  textDirection: TextDirection.rtl,
                  style: textTheme.bodyLarge,
                ),
                SizedBox(width: 3.w),
                Assets.icons.waterIcon.image(height: 7.h, fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
