import 'package:get/get.dart';

class ActivityController extends GetxController {
  final _activity = ActivityLevel.moderatelyActive.obs;

  void setactivity(ActivityLevel activity) {
    _activity.value = activity;
  }

  ActivityLevel get getActivityLevel => _activity.value;
}

enum ActivityLevel {
  sedentary,
  lightlyActive,
  moderatelyActive,
  veryActive,
  superActive
}
