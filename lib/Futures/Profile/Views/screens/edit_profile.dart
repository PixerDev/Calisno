import 'package:flutter/material.dart';

import 'package:flutter_sport_app_1/Core/Controller/user_controller.dart';

import 'package:flutter_sport_app_1/Core/common_widgets/round_gradient_button.dart';
import 'package:flutter_sport_app_1/Core/common_widgets/round_textfield.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
import 'package:flutter_sport_app_1/Futures/BottomNavigation/Controllers/bottom_nav_counter_controller.dart';
import 'package:flutter_sport_app_1/Futures/BottomNavigation/Views/Screens/main_wraper.dart';
import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/activity_controller.dart';
import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/gender_controller.dart';

import 'package:flutter_sport_app_1/gen/assets.gen.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.userController});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
  final UserController userController;
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final textTheme = Get.theme.textTheme;
  final formKey = GlobalKey<FormState>();
  final TextEditingController ageTextController = TextEditingController();
  final TextEditingController weightTextController = TextEditingController();
  final TextEditingController heightTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController bodyFatController = TextEditingController();

  final GenderController genderController = GenderController();

  final ActivityController activityController = ActivityController();
  @override
  Widget build(BuildContext context) {
    nameTextController.text = widget.userController.user.name;

    ageTextController.text =
        ageTextController.text = widget.userController.user.age.toString();

    weightTextController.text = weightTextController.text =
        widget.userController.user.weight.round().toString();

    heightTextController.text = heightTextController.text =
        widget.userController.user.height.round().toString();

    bodyFatController.text = widget.userController.user.bodyFat == null
        ? ''
        : widget.userController.user.bodyFat.toString();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ویرایش اطلاعات',
          textAlign: TextAlign.center,
          style: textTheme.displayLarge?.apply(fontSizeDelta: -3),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 7.h),
          Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    RoundTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا نام کاربری خود را وارد کنید';
                        } else if (value.length < 4) {
                          return 'نام کابری نباید کمتر از 4 حرف باشد';
                        } else if (value.length > 13) {
                          return 'حداکثر 12 حرف';
                        }
                        return null;
                      },
                      hintText: 'نام کاربری',
                      icon: Assets.icons.calendarIcon.path,
                      textInputType: TextInputType.text,
                      textEditingController: nameTextController,
                    ),
                    SizedBox(height: 2.5.h),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightGrayColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Assets.icons.genderIcon.image(
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                  color: AppColors.grayColor)),
                          Expanded(
                              child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              items: ["مرد", "زن"]
                                  .map((name) => DropdownMenuItem(
                                      value: name,
                                      child: Text(name,
                                          style: textTheme.labelSmall)))
                                  .toList(),
                              onChanged: (value) {
                                if (value == 'زن') {
                                  genderController.setgender(Gender.fmale);
                                } else {
                                  genderController.setgender(Gender.male);
                                }
                              },
                              isExpanded: true,
                              hint: Text("انتخاب جنسیت",
                                  style: textTheme.labelSmall),
                            ),
                          )),
                          SizedBox(
                            width: 3.w,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    RoundTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا سن خود را وارد کنید';
                        } else if (int.tryParse(value) == null) {
                          return 'مقدار سن باید عددی باشد';
                        }
                        return null;
                      },
                      textEditingController: ageTextController,
                      hintText: 'سن شما',
                      icon: Assets.icons.calendarIcon.path,
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 2.5.h),
                    RoundTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا وزن خود را وارد کنید';
                        } else if (int.tryParse(value) == null ||
                            double.tryParse(value) == null) {
                          return 'مقدار وزن باید عددی باشد';
                        }
                        return null;
                      },
                      textEditingController: weightTextController,
                      hintText: "وزن",
                      icon: Assets.icons.weightIcon.path,
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 2.5.h),
                    RoundTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا قد خود را وارد کنید';
                        } else if (int.tryParse(value) == null) {
                          return 'مقدار قد باید عددی باشد';
                        }
                        return null;
                      },
                      textEditingController: heightTextController,
                      hintText: "قد",
                      icon: Assets.icons.swapIcon.path,
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 2.5.h),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightGrayColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Assets.icons.genderIcon.image(
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                  color: AppColors.grayColor)),
                          Expanded(
                              child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              items: [
                                'کم‌تحرک',
                                'کمی فعال',
                                'نسبتاً فعال',
                                'بسیار فعال',
                                'فوق‌العاده فعال'
                              ]
                                  .map((name) => DropdownMenuItem(
                                      value: name,
                                      child: Text(name,
                                          style: textTheme.labelSmall)))
                                  .toList(),
                              onChanged: (value) {
                                if (value == 'کم‌تحرک') {
                                  activityController
                                      .setactivity(ActivityLevel.sedentary);
                                } else if (value == 'کمی فعال') {
                                  activityController
                                      .setactivity(ActivityLevel.lightlyActive);
                                } else if (value == 'نسبتاً فعال') {
                                  activityController.setactivity(
                                      ActivityLevel.moderatelyActive);
                                } else if (value == 'بسیار فعال') {
                                  activityController
                                      .setactivity(ActivityLevel.veryActive);
                                } else if (value == 'فوق‌العاده فعال') {
                                  activityController
                                      .setactivity(ActivityLevel.superActive);
                                }
                              },
                              isExpanded: true,
                              hint: Text('میزان فعالیت',
                                  style: textTheme.labelSmall),
                            ),
                          )),
                          SizedBox(
                            width: 3.w,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: AppColors.grayColor,
                            height: 1,
                          ),
                        ),
                        Text(
                          'تکمیل پروفایل',
                          style: textTheme.labelSmall,
                        ),
                        Expanded(
                          child: Container(
                            color: AppColors.grayColor,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    RoundTextField(
                      validator: (value) {
                        return null;
                      },
                      textEditingController: bodyFatController,
                      hintText: "درصدچربی",
                      icon: Assets.icons.weightIcon.path,
                      textInputType: TextInputType.number,
                    ),
                  ],
                ),
              )),
          SizedBox(height: 6.h),
          RoundGradientButton(
            title: "تایید",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                int age = int.parse(ageTextController.text);
                double weight =
                    double.parse(weightTextController.text).toDouble();
                double height =
                    double.parse(heightTextController.text).toDouble();
                String name = nameTextController.text;
                Gender gender = genderController.getGender;
                ActivityLevel activityLevel =
                    activityController.getActivityLevel;

                if (bodyFatController.text.isEmpty) {
                  widget.userController.updateUser(
                    age: age,
                    weight: weight,
                    height: height,
                    name: name,
                    gender: gender,
                    activityLevel: activityLevel,
                  );
                } else {
                  widget.userController.updateUser(
                      age: age,
                      weight: weight,
                      height: height,
                      name: name,
                      gender: gender,
                      activityLevel: activityLevel,
                      bodyFat: int.parse(bodyFatController.text));
                }

                BottomNavCounterController bottomNavCounterController =
                    BottomNavCounterController();

                Get.off(MainWraper(
                    bottomNavCounterModel: bottomNavCounterController.model));
              }
            },
          ),
        ],
      ),
    );
  }
}
