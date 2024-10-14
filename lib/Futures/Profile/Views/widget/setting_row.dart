import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';

class SettingRow extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;

  const SettingRow(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon, height: 15, width: 15, fit: BoxFit.contain),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 12,
                ),
              ),
            ),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
