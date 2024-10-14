import 'package:flutter_sport_app_1/Futures/Dashboard/Services/weight_cont_service.dart';
import 'package:get/get.dart';

class WeightCountController extends GetxController {
  final RxDouble _bmi = 0.0.obs;
  final RxInt _tdee = 0.obs;
  final RxInt _weightCoun = 0.obs;

  final WeightCountService _weightCountService = WeightCountService();

  void calculateWeight() {
    _weightCoun.value =
        _weightCountService.calculateWeightControl(_tdee.value, _bmi.value);
  }

  RxInt get getWeight => _weightCoun;

  void setValue(int tdee, double bmi) {
    _tdee.value = tdee;
    _bmi.value = bmi;
  }
}
