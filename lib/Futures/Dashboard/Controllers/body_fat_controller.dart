import 'package:flutter_sport_app_1/Core/Controller/user_controller.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Controllers/bmi_controller.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Services/body_fat_service.dart';

import 'package:get/get.dart';

class BodyFatController extends GetxController {
  final BmiController bmiController = Get.put(BmiController());
  final UserController userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    calculateboyfat();
  }

  final RxInt _badyfat = 0.obs;
  final RxInt _muscle = 0.obs;
  final BodyFatService _bodyFatService = BodyFatService();
  void calculateboyfat() {
    _badyfat.value = _bodyFatService.calculateBodyFat(22);
    _muscle.value = _bodyFatService.muscle(userController.user.bodyFat?.toInt(),
        _badyfat.value, userController.user.weight);
  }

  RxInt get getBodyFat => _badyfat;
  RxInt get getMuscle => _muscle;
}
