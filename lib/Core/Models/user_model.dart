import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/activity_controller.dart';
import 'package:flutter_sport_app_1/Futures/CreateProfile/Controller/gender_controller.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  final int age;

  @HiveField(1)
  final double weight;

  @HiveField(2)
  final double height;

  @HiveField(3)
  final String name;

  @HiveField(4)
  final Gender gender;

  @HiveField(5)
  final ActivityLevel activityLevel;

  @HiveField(6)
  final int? bodyFat;

  @HiveField(7)
  final bool profileComplete;

  UserModel({
    required this.age,
    required this.weight,
    required this.height,
    required this.name,
    required this.gender,
    required this.activityLevel,
    this.bodyFat,
    required this.profileComplete,
  });
}
