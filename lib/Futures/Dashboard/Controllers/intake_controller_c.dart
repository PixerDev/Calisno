import 'package:flutter_sport_app_1/Core/Controller/user_controller.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Controllers/body_fat_controller.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Services/intake_service_c.dart';

import 'package:get/get.dart';

class IntakeControllerC extends GetxController {
  final UserController userController = Get.put(UserController());
  final BodyFatController bodyFatController = Get.put(BodyFatController());

  final RxInt _proteinC = 0.obs;
  final RxInt _carbohydratesC = 0.obs;
  final RxInt _fatC = 0.obs;

  final RxInt _calorieIntake = 0.obs;
  final IntakeServiceC _inTakeService = IntakeServiceC();
  void calculateIntakes() {
    _proteinC.value = _inTakeService
        .calculateProteincalorie(bodyFatController.getMuscle.value);

    _fatC.value =
        _inTakeService.calculateFatcalorie(bodyFatController.getMuscle.value);

    _carbohydratesC.value = _inTakeService.calculatecarbohydratescalorie(
        _calorieIntake.value, _fatC.value, _proteinC.value);
  }

  RxInt get getproteinC => _proteinC;
  RxInt get getFatC => _fatC;
  RxInt get getCarbohydratesC => _carbohydratesC;

  void setcalorieIntake(int calorieIntake) {
    _calorieIntake.value = calorieIntake;
  }
}
