import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintText;
  final String icon;
  final TextInputType textInputType;
  final bool isObscureText;
  final Widget? rightIcon;
  final FormFieldValidator? validator;
  const RoundTextField(
      {super.key,
      this.textEditingController,
      required this.hintText,
      required this.icon,
      required this.textInputType,
      this.isObscureText = false,
      this.rightIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final themeData = Get.textTheme;
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightGrayColor,
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        validator: validator,
        controller: textEditingController,
        keyboardType: textInputType,
        obscureText: isObscureText,
        style: themeData.bodyLarge!.apply(color: AppColors.blackColor),
        decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,
            suffixIcon: Container(
                alignment: Alignment.center,
                width: 20,
                height: 20,
                child: Image.asset(
                  icon,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                  color: AppColors.grayColor,
                )),
            prefixIcon: rightIcon,
            hintStyle: themeData.labelSmall),
      ),
    );
  }
}
