import 'package:get/get.dart';

class GenderController {
  final _gender = Gender.male.obs;

  void setgender(Gender gender) {
    _gender.value = gender;
  }

  Gender get getGender => _gender.value;
}

enum Gender { male, fmale }
