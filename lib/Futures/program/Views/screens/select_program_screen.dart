import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Futures/program/Controller/program_controller.dart';
import 'package:flutter_sport_app_1/Futures/program/Views/screens/program_screen.dart';
import 'package:flutter_sport_app_1/Futures/program/Views/widgets/program_slide_widget.dart';
import 'package:flutter_sport_app_1/gen/assets.gen.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SelectProgramScreen extends StatelessWidget {
  const SelectProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.theme.textTheme;
    final ProgramController programController = ProgramController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'برنامه',
          textAlign: TextAlign.center,
          style: textTheme.displayLarge?.apply(fontSizeDelta: -3),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 9.h,
          ),
          ProgramSlideWidget(
            ontap: () {
              Get.to(ProgramScreen(
                programs: programController.models[0],
                title: 'برنامه مبتدی',
              ));
            },
            imagePath: Assets.images.goal3.path,
            title: 'برنامه مبتدی',
            subtitle: 'اگر کمتر از 20 حرکت شنا انجام می دهید',
          ),
          ProgramSlideWidget(
            ontap: () {
              Get.to(ProgramScreen(
                programs: programController.models[1],
                title: 'برنامه متوسط',
              ));
            },
            imagePath: Assets.images.goal2.path,
            title: 'برنامه متوسط',
            subtitle: 'اگر بین 20 تا 40 حرکت شنا\n انجام می دهید',
          ),
          ProgramSlideWidget(
            ontap: () {
              Get.to(ProgramScreen(
                programs: programController.models[2],
                title: 'برنامه حرفه ای',
              ));
            },
            imagePath: Assets.images.goal1.path,
            title: 'برنامه حرفه ای',
            subtitle: 'اگر می توانید بیشتر از حرکت شنا\n انجام دهید',
          ),
        ],
      ),
    );
  }
}
