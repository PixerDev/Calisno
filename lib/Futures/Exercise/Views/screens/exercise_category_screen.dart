import 'package:flutter/material.dart';

import 'package:flutter_sport_app_1/Futures/Exercise/Models/category_model.dart';

import 'package:flutter_sport_app_1/Futures/Exercise/Views/widgets/exercise_category_widget.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ExerciseCategoryScreen extends StatelessWidget {
  const ExerciseCategoryScreen({super.key, required this.categories});
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    final themeData = Get.textTheme;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Center(
            child: Text('ورزش',
                textAlign: TextAlign.center,
                style: themeData.displayLarge?.apply(fontSizeDelta: -3)),
          ),
          SizedBox(height: 5.w),
          SizedBox(
            width: 100.w,
            height: 79.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ExerciseCategoryWidget(
                  type: categories[index].type,
                  imagePath: categories[index].imagePath,
                  title: categories[index].title,
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
