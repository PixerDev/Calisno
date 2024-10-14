import 'package:flutter/material.dart';

import 'package:flutter_sport_app_1/Core/Controller/user_controller.dart';
import 'package:flutter_sport_app_1/Core/common_widgets/round_button.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';

import 'package:flutter_sport_app_1/Futures/Ai/controller/ai_getx_controller.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Controllers/water_controller.dart';
import 'package:flutter_sport_app_1/Futures/OnBorading/Views/screens/start_screen.dart';
import 'package:flutter_sport_app_1/Futures/Profile/Views/screens/edit_profile.dart';

import 'package:flutter_sport_app_1/Futures/Profile/Views/widget/setting_row.dart';
import 'package:flutter_sport_app_1/Futures/Profile/Views/widget/title_subtitle_cell.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sizer/sizer.dart';
import 'package:flutter_sport_app_1/gen/assets.gen.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.theme.textTheme;
    final UserController userController = Get.put(UserController());
    final ChatController chatController = Get.put(ChatController());
    final WaterController waterController = Get.put(WaterController());
    List otherArr = [
      {
        "image": "assets/icons/p_contact.png",
        "name": "ارتباط با ما",
        "tag": "5"
      },
      {
        "image": "assets/icons/p_privacy.png",
        "name": "قوانین استفاده",
        "tag": "6"
      },
    ];

    List accountArr = [
      {
        "image": Assets.icons.nextGo.path,
        "name": 'خروج از حساب',
        "tag": "3",
        'ontap': () {
          showCustomDialog(
            context: context,
            ontapSubmit: () {
              waterController.clearData();
              chatController.clearData();
              userController.logout();
              SharedPreferences.getInstance().then((prefs) {
                prefs.setBool('seenOnboarding', true);
              });
              Get.offAll(const StartScreen());
            },
            ontapCancel: () {
              Get.back();
            },
          );
        }
      },
    ];
    return Scaffold(
      backgroundColor: AppColors.lightGrayColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 13.w,
                            height: 13.w,
                            decoration: const BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle),
                            child: Assets.icons.userIcon.image(
                              width: 10.w,
                              height: 10.w,
                              fit: BoxFit.cover,
                            ),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: GetBuilder<UserController>(
                        init: UserController(),
                        builder: (controller) {
                          return Text(
                            userController.user.name,
                            style: textTheme.bodyLarge
                                ?.apply(color: AppColors.blackColor),
                          );
                        },
                      )),
                      SizedBox(
                        width: 70,
                        height: 25,
                        child: RoundButton(
                          title: "ویرایش",
                          type: RoundButtonType.primaryBG,
                          onPressed: () {
                            Get.to(EditProfileScreen(
                              userController: userController,
                            ));
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GetBuilder<UserController>(
                    init: userController,
                    builder: (controller) => Row(
                      children: [
                        Expanded(
                          child: TitleSubtitleCell(
                            title: "${userController.user.height.round()}",
                            subtitle: "قد",
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TitleSubtitleCell(
                            title: '${userController.user.weight}',
                            subtitle: "وزن",
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TitleSubtitleCell(
                            title: '${userController.user.age}',
                            subtitle: "سن",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 2)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "اکانت",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: accountArr.length,
                          itemBuilder: (context, index) {
                            var iObj = accountArr[index] as Map? ?? {};
                            return SettingRow(
                              icon: iObj["image"].toString(),
                              title: iObj["name"].toString(),
                              onPressed: iObj["ontap"],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 2)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "بیشتر",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: otherArr.length,
                          itemBuilder: (context, index) {
                            var iObj = otherArr[index] as Map? ?? {};
                            return SettingRow(
                              icon: iObj["image"],
                              title: iObj["name"],
                              onPressed: () {},
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showCustomDialog(
      {required BuildContext context,
      required VoidCallback ontapSubmit,
      required VoidCallback ontapCancel}) {
    Get.dialog(
      Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text(
            'خروج',
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.apply(color: AppColors.blackColor),
          ),
          content: Text(
            'آیا مطمئنید که می خواهید خارج شوید؟',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.apply(color: AppColors.grayColor),
          ),
          actions: [
            ElevatedButton(
              onPressed: ontapCancel,
              child: const Text('لغو'),
            ),
            ElevatedButton(
              onPressed: ontapSubmit,
              child: const Text('تایید'),
            ),
          ],
        ),
      ),
    );
  }
}
