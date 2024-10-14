import 'package:flutter_sport_app_1/Core/Controller/user_controller.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Controllers/body_fat_controller.dart';

import 'package:flutter_sport_app_1/Futures/Dashboard/Services/intake_service_g.dart';

import 'package:get/get.dart';

class IntakeControllerG extends GetxController {
  final UserController userController = Get.put(UserController());
  final BodyFatController bodyFatController = Get.put(BodyFatController());

  final RxInt _proteinG = 0.obs;
  final RxInt _carbohydratesG = 0.obs;
  final RxInt _fatG = 0.obs;

  final RxInt _calorieIntake = 0.obs;
  final IntakeServiceG _inTakeService = IntakeServiceG();
  void calculateIntakes() {
    _proteinG.value =
        _inTakeService.calculateProtein(bodyFatController.getMuscle.value);

    _fatG.value =
        _inTakeService.calculateFat(bodyFatController.getMuscle.value);

    _carbohydratesG.value = _inTakeService.calculatecarbohydrates(
        _calorieIntake.value, _fatG.value, _proteinG.value);
  }

  RxInt get getproteinG => _proteinG;
  RxInt get getFatG => _fatG;
  RxInt get getCarbohydratesG => _carbohydratesG;

  void setcalorieIntake(int calorieIntake) {
    _calorieIntake.value = calorieIntake;
  }
}
