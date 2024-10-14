import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/activity_controller.dart';
import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/gender_controller.dart';

class TdeeService {
  double calculateTDEE(
      {required double weight,
      required double height,
      required int age,
      required Gender gender,
      required ActivityLevel activityLevel}) {
    double bmr;
    if (gender == Gender.male) {
      bmr = 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      bmr = 10 * weight + 6.25 * height - 5 * age - 161;
    }

    double activityMultiplier;
    switch (activityLevel) {
      case ActivityLevel.sedentary:
        activityMultiplier = 1.2;
        break;
      case ActivityLevel.lightlyActive:
        activityMultiplier = 1.375;
        break;
      case ActivityLevel.moderatelyActive:
        activityMultiplier = 1.55;
        break;
      case ActivityLevel.veryActive:
        activityMultiplier = 1.725;
        break;
      case ActivityLevel.superActive:
        activityMultiplier = 1.9;
        break;
      default:
        activityMultiplier = 1.55;
    }

    return bmr * activityMultiplier;
  }
}
