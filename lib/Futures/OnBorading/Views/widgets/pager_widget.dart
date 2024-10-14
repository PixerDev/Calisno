import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PagerWidget extends StatelessWidget {
  final Map obj;

  const PagerWidget({Key? key, required this.obj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Get.textTheme;
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset(obj["image"],
              width: media.width, fit: BoxFit.fitWidth),
          Padding(
              padding: EdgeInsets.all(7.w),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.5.h),
                    Text(obj["title"], style: themeData.displayLarge),
                    SizedBox(height: 2.5.h),
                    SizedBox(
                      width: 315,
                      child:
                          Text(obj["subtitle"], style: themeData.displayMedium),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
