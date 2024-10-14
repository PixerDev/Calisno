import 'package:flutter_sport_app_1/Core/Controller/user_controller.dart';
import 'package:flutter_sport_app_1/Futures/Dashboard/Services/tdee_service.dart';
import 'package:get/get.dart';

class TdeeController extends GetxController {
  final UserController userController = Get.put(UserController());

  final RxDouble _tdee = 0.0.obs;
  final TdeeService _tdeeService = TdeeService();
  void calculateTdee() {
    _tdee.value = _tdeeService.calculateTDEE(
        weight: userController.user.weight,
        height: userController.user.height,
        age: userController.user.age,
        gender: userController.user.gender,
        activityLevel: userController.user.activityLevel);
  }

  RxDouble get getTdee => _tdee;
}
