// import 'package:flutter/material.dart';

// import 'package:flutter_sport_app_1/Core/common_widgets/round_gradient_button.dart';
// import 'package:flutter_sport_app_1/Core/common_widgets/round_textfield.dart';
// import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';
// import 'package:flutter_sport_app_1/Futures/Auth/Views/screens/login_screen.dart';
// import 'package:flutter_sport_app_1/Futures/CreateProfile/Views/screens/complete_profile_screen.dart';

// import 'package:flutter_sport_app_1/gen/assets.gen.dart';
// import 'package:get/get.dart';

// import 'package:sizer/sizer.dart';

// class SignupScreen extends StatefulWidget {
//   static String routeName = "/SignupScreen";

//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   bool isCheck = false;

//   @override
//   Widget build(BuildContext context) {
//     final themeData = Get.textTheme;
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 8.h,
//                 ),
//                 SizedBox(height: 3.h),
//                 Text("ساخت اکانت جدید",
//                     style: themeData.displayLarge?.apply(fontSizeDelta: -3)),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 RoundTextField(
//                   hintText: "نام",
//                   icon: Assets.icons.profileIcon.path,
//                   textInputType: TextInputType.name,
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 RoundTextField(
//                     hintText: "نام کاربری",
//                     icon: Assets.icons.profileIcon.path,
//                     textInputType: TextInputType.name),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 RoundTextField(
//                     hintText: "ایمیل",
//                     icon: Assets.icons.messageIcon.path,
//                     textInputType: TextInputType.emailAddress),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 RoundTextField(
//                   hintText: "پسورد",
//                   icon: Assets.icons.lockIcon.path,
//                   textInputType: TextInputType.text,
//                   isObscureText: true,
//                   rightIcon: TextButton(
//                       onPressed: () {},
//                       child: Container(
//                           alignment: Alignment.center,
//                           width: 20,
//                           height: 20,
//                           child: Image.asset(
//                             Assets.icons.hidePwdIcon.path,
//                             width: 20,
//                             height: 20,
//                             fit: BoxFit.contain,
//                             color: AppColors.grayColor,
//                           ))),
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Directionality(
//                   textDirection: TextDirection.rtl,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             setState(() {
//                               isCheck = !isCheck;
//                             });
//                           },
//                           icon: Icon(
//                             isCheck
//                                 ? Icons.check_box_outline_blank_outlined
//                                 : Icons.check_box_outlined,
//                             color: AppColors.grayColor,
//                           )),
//                       Expanded(
//                         child: Text(
//                             'با ادامه دادن، شما سیاست حریم خصوصی و شرایط استفاده ما را می‌پذیرید.',
//                             style: themeData.bodySmall),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 RoundGradientButton(
//                   title: "ثبت نام",
//                   onPressed: () {
//                     Get.offAll(const CompleteProfileScreen());
//                   },
//                 ),
//                 SizedBox(
//                   width: 100.w,
//                   height: 2.h,
//                 ),
//                 SizedBox(
//                   height: 13.h,
//                 ),
//                 TextButton(
//                     onPressed: () {
//                       Get.to(const LoginScreen());
//                     },
//                     child: RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                           style: const TextStyle(
//                               color: AppColors.blackColor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400),
//                           children: [
//                             TextSpan(
//                                 text: "حساب دارید؟ ",
//                                 style: themeData.displayMedium),
//                             TextSpan(
//                                 text: " ورود",
//                                 style: themeData.labelLarge?.copyWith(
//                                     color: AppColors.secondaryColor1,
//                                     fontSize: 13.sp)),
//                           ]),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
