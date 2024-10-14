import 'package:flutter_sport_app_1/Core/Models/user_model.dart';
import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/activity_controller.dart';
import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/gender_controller.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class UserController extends GetxController {
  final Box<UserModel> userBox = Hive.box<UserModel>('userBox');
  UserModel _user = UserModel(
    age: 0,
    weight: 0,
    height: 0,
    name: '',
    gender: Gender.male,
    activityLevel: ActivityLevel.lightlyActive,
    profileComplete: false,
  );

  UserModel get user => _user;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void saveUser(UserModel userModel) {
    userBox.put('user', userModel);
    _user = userModel;
    Future.delayed(Duration.zero, () {
      update();
    });
  }

  void loadUser() {
    UserModel? savedUser = userBox.get('user');
    if (savedUser != null) {
      _user = savedUser;
      Future.delayed(Duration.zero, () {
        update();
      });
    }
  }

  void updateUser({
    required int age,
    required double weight,
    required double height,
    required String name,
    required Gender gender,
    required ActivityLevel activityLevel,
    int? bodyFat,
  }) {
    bool profileComplete = bodyFat != null;
    UserModel updatedUser = UserModel(
      age: age,
      weight: weight,
      height: height,
      name: name,
      gender: gender,
      activityLevel: activityLevel,
      bodyFat: bodyFat,
      profileComplete: profileComplete,
    );
    saveUser(updatedUser);
  }

  void logout() {
    userBox.clear();
    _user = UserModel(
      age: 0,
      weight: 0,
      height: 0,
      name: '',
      gender: Gender.male,
      activityLevel: ActivityLevel.lightlyActive,
      profileComplete: false,
    );
    Future.delayed(Duration.zero, () {
      update();
    });
  }
}
