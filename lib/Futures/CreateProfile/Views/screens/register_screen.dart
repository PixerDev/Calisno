import 'package:flutter/material.dart';

import 'package:flutter_sport_app_1/Core/common_widgets/round_gradient_button.dart';
import 'package:flutter_sport_app_1/Core/common_widgets/round_textfield.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/gender_controller.dart';
import 'package:flutter_sport_app_1/Futures/CreateProfile/Views/screens/complete_profile_screen.dart';

import 'package:flutter_sport_app_1/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameTextController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final GenderController genderController = GenderController();
    final themeData = Get.textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 5.w, left: 5.w),
          child: Column(
            children: [
              SvgPicture.asset(
                Assets.images.register,
                height: 41.h,
              ),
              SizedBox(height: 3.h),
              Text('خوش آمدید',
                  style: themeData.displayLarge?.apply(fontSizeDelta: -3)),
              SizedBox(height: 2.h),
              Text('بیا باهم یک زندگی بهتر بسازیم', style: themeData.bodySmall),
              SizedBox(height: 7.h),
              Form(
                key: formKey,
                child: RoundTextField(
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
              ),
              SizedBox(height: 4.h),
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
                        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                child: Text(name, style: themeData.labelSmall)))
                            .toList(),
                        onChanged: (value) {
                          if (value == 'زن') {
                            genderController.setgender(Gender.fmale);
                          } else {
                            genderController.setgender(Gender.male);
                          }
                        },
                        isExpanded: true,
                        hint: Text("انتخاب جنسیت", style: themeData.labelSmall),
                      ),
                    )),
                    SizedBox(
                      width: 3.w,
                    )
                  ],
                ),
              ),
              Expanded(child: SizedBox(height: 2.h)),
              RoundGradientButton(
                title: "بعدی",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final dataToSend = {
                      'name': nameTextController.text,
                      'gender': genderController.getGender,
                    };
                    Get.to(const CompleteProfileScreen(),
                        transition: Transition.rightToLeftWithFade,
                        arguments: dataToSend);
                  }
                },
              ),
              SizedBox(
                height: 2.5.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
