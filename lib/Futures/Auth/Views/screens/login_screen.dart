// import 'package:flutter/material.dart';
// import 'package:flutter_sport_app_1/Core/common_widgets/round_gradient_button.dart';
// import 'package:flutter_sport_app_1/Core/common_widgets/round_textfield.dart';
// import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
// import 'package:flutter_sport_app_1/Futures/Auth/Views/screens/signup_screen.dart';

// import 'package:flutter_sport_app_1/Futures/CreateProfile/Views/screens/welcome_screen.dart';

// import 'package:flutter_sport_app_1/gen/assets.gen.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeData = Get.textTheme;
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: 100.w,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 8.h,
//                     ),
//                     SizedBox(height: 3.h),
//                     Text("خوش آمدید",
//                         textAlign: TextAlign.center,
//                         style:
//                             themeData.displayLarge?.apply(fontSizeDelta: -3)),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 5.h),
//               RoundTextField(
//                   hintText: "ایمیل",
//                   icon: Assets.icons.messageIcon.path,
//                   textInputType: TextInputType.emailAddress),
//               SizedBox(height: 5.h),
//               RoundTextField(
//                 hintText: "رمز عبور",
//                 icon: Assets.icons.lockIcon.path,
//                 textInputType: TextInputType.text,
//                 isObscureText: true,
//                 rightIcon: TextButton(
//                     onPressed: () {},
//                     child: Container(
//                         alignment: Alignment.center,
//                         width: 20,
//                         height: 20,
//                         child: Image.asset(
//                           Assets.icons.hidePwdIcon.path,
//                           width: 20,
//                           height: 20,
//                           fit: BoxFit.contain,
//                           color: AppColors.grayColor,
//                         ))),
//               ),
//               SizedBox(height: 2.h),
//               RoundGradientButton(
//                 title: "ورود",
//                 onPressed: () {
//                   Get.offAll(const WelcomeScreen());
//                 },
//               ),
//               SizedBox(height: 36.h),
//               TextButton(
//                   onPressed: () {
//                     Get.to(const SignupScreen());
//                   },
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                         style: TextStyle(
//                             color: AppColors.blackColor,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400),
//                         children: [
//                           TextSpan(
//                               text: "حساب ندارید؟ ",
//                               style: themeData.displayMedium),
//                           TextSpan(
//                               text: " ثبت نام",
//                               style: themeData.labelLarge?.copyWith(
//                                   color: AppColors.secondaryColor1,
//                                   fontSize: 13.sp)),
//                         ]),
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
