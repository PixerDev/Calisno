import 'package:flutter_sport_app_1/Core/Controller/user_controller.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Services/bmi_service.dart';
import 'package:get/get.dart';

class BmiController extends GetxController {
  final UserController userController = Get.put(UserController());
  final RxDouble _bmi = 0.0.obs;
  final RxString _bmiCategory = ''.obs;
  final RxString _bestWeight = ''.obs;

  final BmiService _bmiService = BmiService();

  void calculateBmi() {
    _bmi.value = _bmiService.calculateBmi(
        height: userController.user.height, weight: userController.user.weight);
    _bmiCategory.value = _bmiService.getBmiCategory(_bmi.value);
    _bestWeight.value = _bmiService.bestwight(
        height: userController.user.height, weight: userController.user.height);
  }

  RxDouble get getbmi => _bmi;
  RxString get getBmiCategory => _bmiCategory;
  RxString get getBestWeight => _bestWeight;
}
