import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Core/common_widgets/round_gradient_button.dart';
import 'package:flutter_sport_app_1/Core/common_widgets/round_textfield.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
import 'package:flutter_sport_app_1/Futures/CreateProfile/Views/screens/activity_screen.dart';
import 'package:flutter_sport_app_1/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController ageTextController = TextEditingController();
    final TextEditingController weightTextController = TextEditingController();
    final TextEditingController heightTextController = TextEditingController();
    final themeData = Get.textTheme;
    Map<String, dynamic> dataReceived = Get.arguments;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 5.w, left: 5.w),
            child: Column(
              children: [
                SvgPicture.asset(
                  Assets.images.completeProfile,
                  height: 41.h,
                ),
                SizedBox(height: 3.h),
                Text("بیا پروفایلت رو کامل کنیم",
                    style: themeData.displayLarge?.apply(fontSizeDelta: -3)),
                SizedBox(height: 2.h),
                Text('این کمک می‌کنه که بیشتر با شما آشنا بشیم',
                    style: themeData.bodySmall),
                SizedBox(height: 6.h),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
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
                            } else if (int.tryParse(value) == null) {
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
                      ],
                    )),
                SizedBox(height: 5.h),
                RoundGradientButton(
                  title: "بعدی",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final dataToSend = {
                        'age': int.parse(ageTextController.text),
                        'weight': double.parse(weightTextController.text),
                        'height': double.parse(heightTextController.text),
                        'registerDataReceived': dataReceived
                      };
                      Get.to(const ActivityScreen(),
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
      ),
    );
  }
}
