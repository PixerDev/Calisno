import 'package:get/get.dart';
import 'package:hive/hive.dart';

class WaterController extends GetxController {
  var glassesOfWater = 0.obs;
  late Box<int> waterBox;

  @override
  void onInit() {
    super.onInit();
    waterBox = Hive.box<int>('waterBox'); // Ensure correct box type
    glassesOfWater.value = waterBox.get('glassesOfWater', defaultValue: 0)!;
    resetDaily();
  }

  void increment() {
    glassesOfWater.value++;
    waterBox.put('glassesOfWater', glassesOfWater.value);
  }

  void decrement() {
    if (glassesOfWater.value > 0) {
      glassesOfWater.value--;
      waterBox.put('glassesOfWater', glassesOfWater.value);
    }
  }

  void resetDaily() async {
    // Schedule a daily reset
    DateTime now = DateTime.now();
    DateTime resetTime = DateTime(now.year, now.month, now.day + 1);
    Duration durationUntilReset = resetTime.difference(now);

    await Future.delayed(durationUntilReset);
    glassesOfWater.value = 0;
    waterBox.put('glassesOfWater', 0);
    resetDaily(); // Schedule the next reset
  }

  void clearData() {
    glassesOfWater.value = 0;
    waterBox.put('glassesOfWater', 0);
    waterBox.clear();
  }
}
