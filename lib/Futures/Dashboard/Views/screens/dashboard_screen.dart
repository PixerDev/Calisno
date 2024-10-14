import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';

import 'package:flutter_sport_app_1/Futures/Dashboard/Controllers/bmi_controller.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Controllers/body_fat_controller.dart';

import 'package:flutter_sport_app_1/Futures/Dashboard/Controllers/intake_controller_c.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Controllers/intake_controller_g.dart';

import 'package:flutter_sport_app_1/Futures/Dashboard/Controllers/tdee_controller.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Controllers/water_controller.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Controllers/weight_count_controller.dart';

import 'package:flutter_sport_app_1/Futures/Dashboard/Views/widgets/calorie_widget.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Views/widgets/water_widget.dart';
import 'package:flutter_sport_app_1/gen/assets.gen.dart';

import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final BodyFatController bodyFatController = BodyFatController();
  final IntakeControllerC intakeControllerC = IntakeControllerC();

  final IntakeControllerG intakeControllerG = IntakeControllerG();

  final WaterController waterController = Get.put(WaterController());
  final BmiController bmiController = BmiController();
  final TdeeController tdeeController = TdeeController();

  final WeightCountController weightCountController = WeightCountController();
  final TextEditingController fatController = TextEditingController();
  final TextEditingController proteinController = TextEditingController();
  final TextEditingController carbohydrateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.theme.textTheme;
    var media = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 9.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                Container(
                  height: media.width * 0.4,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: AppColors.primaryG),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6.5.w),
                          topRight: Radius.circular(6.5.w))),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Assets.icons.bgDots.image(
                        height: media.width * 0.4,
                        width: double.maxFinite,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.9.h, horizontal: 4.w),
                          child: Obx(() {
                            bmiController.calculateBmi();
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 1.5.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        bmiController.getbmi.value
                                            .toStringAsFixed(1),
                                        style: TextStyle(
                                            shadows: [
                                              BoxShadow(
                                                  color: AppColors
                                                      .secondaryColor2
                                                      .withOpacity(0.5),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 5))
                                            ],
                                            fontSize: 55.sp,
                                            fontWeight: FontWeight.w900,
                                            color: AppColors.lightGrayColor),
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("BMI (شاخص توده بدنی)",
                                                style: textTheme.bodyLarge),
                                            Text(
                                                bmiController
                                                    .getBmiCategory.value,
                                                style: textTheme.bodySmall
                                                    ?.apply(
                                                        color: AppColors
                                                            .whiteColor)),
                                            SizedBox(
                                                height: media.width * 0.05),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(bmiController.getBestWeight.value,
                                    style: textTheme.bodySmall
                                        ?.apply(color: AppColors.whiteColor)),
                              ],
                            );
                          })),
                    ],
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(6.5.w),
                          bottomRight: Radius.circular(6.5.w)),
                      gradient: LinearGradient(colors: AppColors.secondaryG)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() {
                              tdeeController.calculateTdee();
                              return Text(
                                tdeeController.getTdee.value.round().toString(),
                                style: textTheme.bodyLarge
                                    ?.apply(fontSizeDelta: 2),
                              );
                            }),
                            Text(
                              'کالری مصرفی روزانه',
                              style: textTheme.bodyLarge,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() {
                              weightCountController.setValue(
                                  tdeeController.getTdee.value.round(),
                                  bmiController.getbmi.value);
                              weightCountController.calculateWeight();
                              return Text(
                                weightCountController.getWeight.toString(),
                                style: textTheme.bodyLarge
                                    ?.apply(fontSizeDelta: 2),
                              );
                            }),
                            Text(
                              'کالری ورودی روزانه',
                              style: textTheme.bodyLarge,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 3.h),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.lightGrayColor,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.midGrayColor.withOpacity(0.5),
                        blurRadius: 2,
                        offset: const Offset(0, 4)),
                  ],
                  borderRadius: BorderRadius.circular(6.5.w)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: Obx(() {
                      intakeControllerC.setcalorieIntake(
                          weightCountController.getWeight.value);
                      intakeControllerC.calculateIntakes();
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CalorieWidget(
                            calorie:
                                intakeControllerC.getproteinC.value.toString(),
                            svgpath: Assets.icons.steak.path,
                            title: 'پروتئین',
                          ),
                          CalorieWidget(
                            calorie: intakeControllerC.getCarbohydratesC.value
                                .toString(),
                            svgpath: Assets.icons.carbohydrates.path,
                            title: 'کروهیدرات',
                          ),
                          CalorieWidget(
                            calorie: intakeControllerC.getFatC.value.toString(),
                            svgpath: Assets.icons.fat.path,
                            title: 'چربی',
                          )
                        ],
                      );
                    }),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Container(
                        color: AppColors.midGrayColor,
                        height: 0.06.h,
                      )),
                  SizedBox(height: 1.h),
                  Center(
                    child: Text(
                      ':میزان مصرف',
                      style: textTheme.labelSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Obx(() {
                    bodyFatController.calculateboyfat();
                    intakeControllerG.setcalorieIntake(
                        weightCountController.getWeight.value);
                    intakeControllerG.calculateIntakes();
                    return Padding(
                      padding: EdgeInsets.all(1.5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CalorieWidgetSec(
                            value: intakeControllerG.getproteinG.value,
                            image: Assets.icons.steak.path,
                            title: 'پروتئین',
                          ),
                          CalorieWidgetSec(
                            value: intakeControllerG.getCarbohydratesG.value,
                            image: Assets.icons.carbohydrates.path,
                            title: 'کربوهیدرات',
                          ),
                          CalorieWidgetSec(
                            value: intakeControllerG.getFatG.value,
                            image: Assets.icons.fat.path,
                            title: 'چربی',
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(height: 1.5.h),
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h),
          WaterWidget(
            waterCount: waterController.glassesOfWater,
            addTap: () {
              waterController.increment();
            },
            removeTap: () {
              waterController.decrement();
            },
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

class CalorieWidgetSec extends StatelessWidget {
  const CalorieWidgetSec({
    super.key,
    required this.title,
    required this.image,
    required this.value,
  });
  final String title;
  final String image;
  final int value;
  @override
  Widget build(BuildContext context) {
    final textTheme = Get.theme.textTheme;
    return Row(
      children: [
        Text(
          '$title($valueگرم)',
          textDirection: TextDirection.rtl,
          style: textTheme.labelSmall,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.1.w),
          child: Container(
            width: 7.w,
            height: 7.w,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor1,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                image,
                width: 5.w,
                height: 5.w,
              ),
            ),
          ),
        )
      ],
    );
  }
}










//  void _showDialogBox() {
//     Get.dialog(
//       AlertDialog(
//         title: Text('Dialog Box'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Column(
//               children: [
//                 RoundTextField(
//                   hintText: 'پروتئین',
//                   icon: Assets.icons.weightIcon.path,
//                   textInputType: TextInputType.number,
//                   textEditingController: proteinController,
//                 ),
//                 SizedBox(
//                   height: 1.5.h,
//                 ),
//                 RoundTextField(
//                   hintText: 'کربوهیدرات',
//                   textEditingController: carbohydrateController,
//                   icon: Assets.icons.weightIcon.path,
//                   textInputType: TextInputType.number,
//                 ),
//                 SizedBox(
//                   height: 1.5.h,
//                 ),
//                 RoundTextField(
//                   hintText: 'چربی',
//                   textEditingController: fatController,
//                   icon: Assets.icons.weightIcon.path,
//                   textInputType: TextInputType.number,
//                 ),
//               ],
//             )
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               final controller = Get.find<DialogController>();
//               controller.submit();
//               Get.back(); // Close the dialog box
//             },
//             child: Text('تایید'),
//           ),
//           TextButton(
//             onPressed: () {
//               Get.back();
//             },
//             child: Text('لغو'),
//           ),
//         ],
//       ),
//     );
//   }