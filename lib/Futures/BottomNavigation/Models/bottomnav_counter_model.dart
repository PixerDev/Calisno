import 'package:get/get.dart';

class BottomNavCounterModel extends GetxController {
  final RxInt _selectedTabIndex = 2.obs;

  int get selectedTabIndex => _selectedTabIndex.value;
  void setTabIndex(int num) {
    _selectedTabIndex.value = num;
  }
}
